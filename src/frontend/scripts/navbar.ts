/**
 * navbar.ts:
 * Contains code for the navbar
 */

/**
 * Imports from other files
 */
import axios, {AxiosResponse} from "./main";
import "popper.js"
import "bootstrap"
import Swal from "sweetalert2";
import {addAlert, addErrorAlert, addTempAlert} from "./alert";
import {validSelect} from "./edit_courses";
import {AlertType, Who, Whoami} from "./interfaces";
import {setNeutral} from "./register";

/**
 * Constant variable declarations (mostly HTML elements)
 */
export const navbarStudentView = document.getElementById("navbar-student-view") as HTMLLIElement,
    navbarEditCourses = document.getElementById("navbar-edit-courses") as HTMLLIElement,
    navbarEditUsers = document.getElementById("navbar-edit-users") as HTMLLIElement,
    navbarChangePasswordLink = document.getElementById("navbar-change-password") as HTMLAnchorElement,
    navbarLogoutLink = document.getElementById("navbar-logout") as HTMLAnchorElement,
    navbarDumpAllDatabasesLink = document.getElementById("navbar-dump-all-databases") as HTMLAnchorElement,
    navbarGhostDatabasesLink = document.getElementById("navbar-missing-databases") as HTMLAnchorElement,
    ghostDatabasesSelect = document.getElementById("selected-missing-database") as HTMLSelectElement,
    deleteGhostDatabaseButton = document.getElementById("delete-missing-database-button") as HTMLButtonElement,
    deleteAllGhostDatabasesButton = document.getElementById("delete-all-missing-databases-button") as HTMLButtonElement,
    selectedGhostDatabaseDefault = document.getElementById("selected-missing-database-default") as HTMLOptionElement;

/**
 * Global variables that will be changed later on (arrays and such)
 */
let databaseStrings: string[] = [];

/**
 * Calls /rest/whoami and unwraps the data
 * @returns A promise of the Whoami object (see [[Whoami]] )
 */
export async function getWhoamiPromise(): Promise<Whoami> {
    const response: AxiosResponse = await axios.get("/rest/whoami/");
    return response.data;
}

/**
 * Calls /rest/who and unwraps the data
 * @returns A promise of the Who object (see [[Who]] )
 */
export async function getWhoPromise(): Promise<Who> {
    const response: AxiosResponse = await axios.get("/rest/who/");
    return response.data;
}

/**
 * Disables / enables the navbar elements
 * @param enable Whether to enable or disable elements
 */
function changeNavbarState(enable: boolean): void {
    [navbarStudentView, navbarEditCourses, navbarEditUsers].forEach((element: HTMLLIElement) => {
        if (element) {

            try {
                if (enable) {
                    (element.firstElementChild as HTMLAnchorElement)!.classList.remove("disabled")
                } else {
                    (element.firstElementChild as HTMLAnchorElement)!.classList.add("disabled")

                }
            } catch (error) {
                console.log(error)
            }
        }
    });

    [navbarChangePasswordLink, navbarLogoutLink, navbarDumpAllDatabasesLink, navbarGhostDatabasesLink].forEach((element: Element) => {
        if (element) {
            try {
                if (enable) {
                    element.classList.remove("disabled")
                } else {
                    element.classList.add("disabled")

                }
            } catch (error) {
                console.log(error)
            }
        }

    });
}

/**
 * Disables / enables elements in both the navbar and the current page
 * @param enable Whether to enable or disable things
 * @param callback The function that disables/enables things on the current page
 */
export function changePageState(enable: boolean, callback: Function): void {
    changeNavbarState(enable);
    callback(enable);
}

/**
 * Makes a generate migrations script (if the user agrees to it)
 * @param disableCallback The function that disables/enables all the elements on the current page
 * @returns whether the operation was a success
 */
async function generateMigrations(disableCallback: Function): Promise<boolean> {
    const result = await Swal.fire({
        title: 'You are about to generate a migration shell script!',
        html: `Clicking migrate will create a shell script that generate a migration of all databases in the system.
                The location of this shell script will be shown after it has been generated.<br><br>
                The script will NOT be ran automatically; you will have to connect to the server and execute it manually.
                After execution, a tarball will be created containing SQL dumps of all databases.<br><br>
                This tarball will also include a script to restore these dumps to a new database.`.trim(),
        type: 'warning',
        showCancelButton: true,
        focusCancel: true,
        confirmButtonText: 'Generate script',
        cancelButtonText: 'Cancel'
    });

    if (result.dismiss === Swal.DismissReason.cancel) {
        return false;
    }
    let success: boolean;

    changePageState(false, disableCallback);
    const tempAlert: ChildNode | null = addTempAlert();
    try {
        const response = await axios.post(`/rest/generate_migration/`) as AxiosResponse<string>;
        const data = response.data;
        console.log(data);
        addAlert(data, AlertType.success, tempAlert);
        success = true;
    } catch (error) {
        addErrorAlert(error, tempAlert);
        success = false;
    } finally {
        changePageState(true, disableCallback);
    }

    return success;

}

/**
 * Populates the modal for deleting ghost databases (sets inputs and buttons to correct states and values)
 */
async function populateGhostDatabasesModal(): Promise<void> {
    ghostDatabasesSelect.disabled = true;
    while (ghostDatabasesSelect.lastElementChild !== ghostDatabasesSelect.firstElementChild) {
        const child: Element = ghostDatabasesSelect.lastElementChild!;
        ghostDatabasesSelect.removeChild(child!);
    }

    databaseStrings = (await axios.get("/rest/missing_databases/") as AxiosResponse<string[]>).data;
    if (databaseStrings.length === 0) {
        deleteAllGhostDatabasesButton.disabled = true;
        deleteGhostDatabaseButton.disabled = true;
        selectedGhostDatabaseDefault.innerText = "There are no ghost databases!";
    } else {

        for (let i = 1; i < databaseStrings.length + 1; i++) {
            const optionNode = document.createElement("option");
            optionNode.setAttribute("value", String(i));
            optionNode.appendChild(document.createTextNode(databaseStrings[i - 1]));
            ghostDatabasesSelect.appendChild(optionNode);
        }
        ghostDatabasesSelect.disabled = false;
        deleteAllGhostDatabasesButton.disabled = false;
        deleteGhostDatabaseButton.disabled = false;
        selectedGhostDatabaseDefault.innerText = "Please select a database";

    }
}

/**
 * Deletes all ghost databases if the user is sure they want this
 * @param disableCallback The function that disables/enables all the elements on the current page
 * @returns whether the operation was a success
 */
async function deleteAllGhostDatabases(disableCallback: Function): Promise<boolean> {
    const result = await Swal.fire({
        title: 'Are you sure you want to delete all these databases?',
        text: 'You will not be able to recover your data!',
        type: 'warning',
        showCancelButton: true,
        focusCancel: true,
        confirmButtonText: 'Delete',
        cancelButtonText: 'Cancel'
    });

    if (result.dismiss === Swal.DismissReason.cancel) {
        return false;
    }
    let success: boolean;
    const tempAlert: ChildNode | null = addTempAlert();
    changePageState(false, disableCallback);
    try {
        const deleteConfig = {'data': databaseStrings};
        await axios.delete(`/rest/missing_databases/`, deleteConfig);
        addAlert("Successfully deleted ghost databases", AlertType.success, tempAlert);
        success = true;
    } catch (error) {
        addErrorAlert(error, tempAlert);
        success = false;
    } finally {
        changePageState(true, disableCallback);
        populateGhostDatabasesModal();
        setNeutral(ghostDatabasesSelect);
    }
    return success;
}

/**
 * Deletes the selected ghost database, if the user is sure they want this
 * @param disableCallback The function that disables/enables all the elements on the current page
 * @returns whether the operation was a success
 */
async function deleteGhostDatabase(disableCallback: Function): Promise<boolean> {
    if (!validSelect(ghostDatabasesSelect)) {
        return false;
    }

    const result = await Swal.fire({
        title: 'Are you sure you want to delete this database?',
        text: 'You will not be able to recover your data!',
        type: 'warning',
        showCancelButton: true,
        focusCancel: true,
        confirmButtonText: 'Delete',
        cancelButtonText: 'Cancel'
    });

    if (result.dismiss === Swal.DismissReason.cancel) {
        return false;
    }
    let success: boolean;
    const tempAlert: ChildNode | null = addTempAlert();
    changePageState(false, disableCallback);
    try {
        const deleteConfig = {'data': [databaseStrings[Number(ghostDatabasesSelect.value) - 1]]};
        await axios.delete(`/rest/missing_databases/`, deleteConfig);
        addAlert("Successfully deleted ghost database", AlertType.success);
        success = true;
    } catch (error) {
        addErrorAlert(error, tempAlert);
        success = false;
    } finally {
        changePageState(true, disableCallback);
        populateGhostDatabasesModal();
        setNeutral(ghostDatabasesSelect);
    }
    return success;
}

/**
 * Initiates all the event listeners with the proper callbacks (if the relevant elements exist, not all roles get to see the same elements)
 * @param disableCallback The function that disables/enables all the elements on the current page
 */
export function initNavbar(disableCallback: Function): void {
    if (navbarDumpAllDatabasesLink) {
        navbarDumpAllDatabasesLink.addEventListener("click", (event) => {
            event.preventDefault();
            generateMigrations(disableCallback);
        })
    }

    if (navbarGhostDatabasesLink) {
        navbarGhostDatabasesLink.addEventListener("click", (event) => {
            event.preventDefault();
            populateGhostDatabasesModal();
        })
    }
    if (deleteAllGhostDatabasesButton) {
        deleteAllGhostDatabasesButton.addEventListener("click", () => {
            deleteAllGhostDatabases(disableCallback);
        });

    }

    if (deleteGhostDatabaseButton) {
        deleteGhostDatabaseButton.addEventListener("click", () => {
            deleteGhostDatabase(disableCallback);
        })
    }


}


