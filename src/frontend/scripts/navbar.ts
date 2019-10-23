import axios, {AxiosResponse} from 'axios';
import "popper.js"
import "bootstrap"
import {UserRole} from "./user";
import Swal from "sweetalert2";
import {addAlert, addErrorAlert, addTempAlert, AlertType} from "./alert";

const whoamiWelcomeHtml: HTMLDivElement = document.getElementById("whoamiWelcome") as HTMLDivElement;
const whoamiButtonHtml: HTMLDivElement = document.getElementById("whoamiButton") as HTMLDivElement;

export const navbarStudentView = document.getElementById("navbar-student-view") as HTMLLIElement;
export const navbarEditCourses = document.getElementById("navbar-edit-courses") as HTMLLIElement;
export const navbarEditUsers = document.getElementById("navbar-edit-users") as HTMLLIElement;
export const navbarChangePasswordLink = document.getElementById("navbar-change-password") as HTMLAnchorElement;
export const navbarLogoutLink = document.getElementById("navbar-logout") as HTMLAnchorElement;
export const navbarDumpAllDatabasesLink = document.getElementById("navbar-dump-all-databases") as HTMLAnchorElement;

export interface Whoami {
    id: number;
    email: string;
    role: UserRole;
}

export interface Who {
    id: number,
    role: UserRole
}

export async function getWhoamiPromise(): Promise<Whoami> {
    const response: AxiosResponse = await axios.get("/rest/whoami/");
    return response.data;
}

export async function getWhoPromise(): Promise<Who> {
    const response: AxiosResponse = await axios.get("/rest/who/");
    return response.data;
}

function changeNavbarState(enable: boolean): void {
        [navbarStudentView, navbarEditCourses, navbarEditUsers].forEach((element: HTMLLIElement) => {
        if (enable) {
            (element.firstElementChild as HTMLAnchorElement)!.classList.remove("disabled")
        } else {
            (element.firstElementChild as HTMLAnchorElement)!.classList.add("disabled")

        }


    });

    [navbarChangePasswordLink, navbarLogoutLink, navbarDumpAllDatabasesLink].forEach((element: Element) => {
        if (enable) {
            element.classList.remove("disabled")
        } else {
            element.classList.add("disabled")

        }
    });
}

export function changePageState(enable: boolean, callback: Function): void {


    changeNavbarState(enable);

    callback(enable);



}

async function dumpAlldatabases(disableCallback: Function): Promise<boolean> {
    const result = await Swal.fire({
        title: 'title',
        text: 'do some migration',
        type: 'warning',
        showCancelButton: true,
        focusCancel: true,
        confirmButtonText: 'migrate',
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
        const data=response.data;
        console.log(data);
        addAlert(data, AlertType.success, tempAlert);
        success=true;
    } catch (error) {
        addErrorAlert(error, tempAlert);
        success=false;
    } finally {
        changePageState(true, disableCallback);
    }

    return success;

}

export function initNavbar(disableCallback: Function): void {
    if (navbarDumpAllDatabasesLink) {
        navbarDumpAllDatabasesLink.addEventListener("click", (event) => {
            event.preventDefault();
            dumpAlldatabases(disableCallback);
        })
    }


}

export async function displayWhoami(): Promise<void> {
    return;
    // const whoami: Whoami = await getWhoamiPromise();
    // let role: string;
    // if (whoami.role === UserRole.admin) {
    //     role = "admin";
    // } else if (whoami.role === UserRole.teacher) {
    //     role = "teacher";
    // } else if (whoami.role === UserRole.student) {
    //     role = "student";
    // } else {
    //     role = "unknown";
    // }
    // whoamiWelcomeHtml.innerHTML += whoami.email + " (" + role +")";
    // whoamiButtonHtml.innerHTML += "<button class=\"btn btn-secondary\" href=\"/settings\">Settings</button>";
}
