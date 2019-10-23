import {Course, getCoursesPromise, StudentDatabase, tryGetCredentials} from './courses'
import {changeNavbarState, displayWhoami, getWhoPromise, navbarStudentView, Who} from "./navbar";
import axios from 'axios';
import "popper.js"
import "bootstrap"
import {addAlert, addErrorAlert, AlertType} from "./alert";
import Swal from 'sweetalert2'
import {UserRole} from "./user";

const coursesNavHtml: HTMLDivElement = document.getElementById("courses-nav") as HTMLDivElement;
const noCredsCoursename: HTMLHeadingElement = document.getElementById("no-credentials-coursename") as HTMLDivElement;
const noCredsInfo: HTMLDivElement = document.getElementById("no-credentials-courseinfo") as HTMLDivElement;
const haveCredsCoursename: HTMLHeadingElement = document.getElementById("have-credentials-coursename") as HTMLDivElement;
const haveCredsInfo: HTMLDivElement = document.getElementById("have-credentials-courseinfo") as HTMLDivElement;
const credentialsDiv: HTMLDivElement = document.getElementById("credentials-div") as HTMLDivElement;
const haveCredsPane: HTMLDivElement = document.getElementById("have-credentials-pane") as HTMLDivElement;
const noCredsPane: HTMLHeadingElement = document.getElementById("no-credentials-pane") as HTMLDivElement;
const noCredsForm = document.getElementById("no-credentials-form") as HTMLFormElement;

const credentialsButton: HTMLButtonElement = document.getElementById("credentials-button") as HTMLButtonElement;

const groupInput: HTMLInputElement = document.getElementById("group-input") as HTMLInputElement;
const alertDiv: HTMLDivElement = document.getElementById("alert-div") as HTMLDivElement;


let ownDatabases: StudentDatabase[];
let courses: Course[];
let currentCourse = 0;
let who: Who;

function populateNoCredentialsPane(i: number) {
    noCredsCoursename.innerText = courses[i].coursename;
    noCredsInfo.innerHTML = courses[i].info; // We set innerHTML for this field because we know it is sanitized using html special chars
    groupInput.value = "";
}


async function populateHaveCredentialsPane(i: number) {
    let credentials = "";
    const dbIDs: number[] = [];
    haveCredsCoursename.innerText = courses[i].coursename;
    haveCredsInfo.innerHTML = courses[i].info; // We set innerHTML for this field because we know it is sanitized using html special chars
    ownDatabases.forEach((db: StudentDatabase) => {
        if (db.course === courses[i].courseid) {
            const html = `<div class="mt-5 form-group row">
                            <label class="col-12 col-md-4 col-form-label">Username:</label>
                            <div class="col-12 col-md-8">
                                <input type="text" class="form-control" value="${db.username}" readonly="">
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-12 col-md-4 col-form-label">Password:</label>
                            <div class="col-12 col-md-8">
                                <input type="text" class="form-control" value="${db.password}" readonly="">
                            </div>
                        </div>
                        <div class="align-items-center align-items-stretch row">
                            <div class="center-block col-12 col-md-4 my-2 my-md-4 d-flex">
                                <button id="delete-button-${db.dbid}" class="btn btn-danger delete-button btn-block">Delete database and release credentials</button>
                            </div>
                            <div class="center-block col-12 col-md-4 my-2 my-md-4 d-flex">
                                <button id="reset-button-${db.dbid}" class="btn btn-info reset-button btn-block">Reset database</button>
                            </div>
                            <div class="center-block col-12 col-md-4 my-2 my-md-4 d-flex">
                                <button onclick="window.location.replace('/rest/dump/${db.dbid}/')" id="dump-button-${db.dbid}" class="btn btn-secondary dump-button btn-block">Get dump of database</button>
                            </div>
                        </div>
                        <hr>`;
            // TODO make third button mobile-friendly
            credentials += html.trim();
            dbIDs.push(db.dbid)
        }
    });
    credentialsDiv.innerHTML = credentials;
    dbIDs.forEach((id: number) => {
        const deleteButton: HTMLButtonElement = document.getElementById(`delete-button-${id}`) as HTMLButtonElement;
        const resetButton: HTMLButtonElement = document.getElementById(`reset-button-${id}`) as HTMLButtonElement;
        deleteButton.addEventListener("click", () => {
            prepareToDeleteCredentials(id);
        });
        resetButton.addEventListener("click", () => {
            resetDatabase(id);
        });

    });

}

function createNavLink(haveCredentials: boolean, i: number, active = false): DocumentFragment {
    const credentialsClass = haveCredentials ? "have-credentials-nav" : "no-credentials-nav";
    const hrefString = haveCredentials ? "have-credentials-pane" : "no-credentials-pane";
    const activeString = active ? "active" : "";
    const templateString = `<a id="${i}" class="nav-link ${credentialsClass} ${activeString}" data-toggle="pill" href="#${hrefString}">${courses[i].coursename}</a>`;
    const fragment: DocumentFragment = document.createRange().createContextualFragment(templateString);

    if (!haveCredentials) {
        fragment.firstElementChild!.addEventListener("click", () => {
            populateNoCredentialsPane(i);
        });
    } else {
        fragment.firstElementChild!.addEventListener("click", () => {
            populateHaveCredentialsPane(i);
        });
    }

    fragment.firstElementChild!.addEventListener("click", () => {
        currentCourse = courses[i].courseid;
        alertDiv.innerHTML = "" // Remove all alerts when switching course
    });
    return fragment;
}

async function displayCourses(): Promise<void> {
    who = await getWhoPromise();

    courses = (await getCoursesPromise()).sort((a: Course, b: Course) => a.coursename.localeCompare(b.coursename));
    ownDatabases = await (await axios.get("/rest/studentdatabases/own/")).data as StudentDatabase[];
    // tslint:disable-next-line:variable-name
    const ownCourses = ownDatabases.map((db: StudentDatabase) => db.course);
    for (let i = 0; i < courses.length; i++) {
        const youHavePrivilege = (who.role === UserRole.admin || who.role === UserRole.teacher);
        // TODO  check if user is TA for course
        if (courses[i].active || youHavePrivilege) {
            const haveCredentials = (ownCourses.includes(courses[i].courseid)); // TODO change this later when max databases > 1
            const fragment = createNavLink(haveCredentials, i);

            coursesNavHtml.appendChild(fragment);
        }


    }
}

async function changeView(hasCredentials: boolean) {
    const activeLink: HTMLAnchorElement = document.getElementsByClassName("nav-link active")[0] as HTMLAnchorElement;
    const oldPane = hasCredentials ? noCredsPane : haveCredsPane;
    const newPane = hasCredentials ? haveCredsPane : noCredsPane;
    const i = Number(activeLink.id);
    const fragment = createNavLink(hasCredentials, i, true);
    activeLink.classList.remove("active");
    activeLink.insertAdjacentElement("afterend", fragment.firstElementChild!);
    activeLink.remove();
    ownDatabases = (await axios.get("/rest/studentdatabases/own/")).data as StudentDatabase[];
    oldPane.classList.remove("active");
    newPane.classList.add("active");
    if (hasCredentials) {
        await populateHaveCredentialsPane(i);
    } else {
        await populateNoCredentialsPane(i);
    }
}

async function prepareToGetCredentials() {
    coursesNavHtml.childNodes.forEach((node: ChildNode) => (node as HTMLAnchorElement).classList.add("disabled"));
    credentialsButton.disabled = true;
    groupInput.disabled = true;
    try {
        const success = await tryGetCredentials(currentCourse, Number(groupInput.value), false);

        if (success) {
            await changeView(true);
        }

    } catch (error) {
        addErrorAlert(error);
    } finally {
        coursesNavHtml.childNodes.forEach((node: ChildNode) => (node as HTMLLinkElement).classList.remove("disabled"));
        credentialsButton.disabled = false;
        groupInput.disabled = false;
    }
}


function disableElementsOnPage() {
    coursesNavHtml.childNodes.forEach((node: ChildNode) => (node as HTMLAnchorElement).classList.add("disabled"));
    Array.from(document.getElementsByClassName("delete-button") as HTMLCollectionOf<HTMLButtonElement>)
        .forEach((deleteButton: HTMLButtonElement) => {
            deleteButton.disabled = true
        });
    Array.from(document.getElementsByClassName("reset-button") as HTMLCollectionOf<HTMLButtonElement>)
        .forEach((resetButton: HTMLButtonElement) => {
            resetButton.disabled = true
        });
    Array.from(document.getElementsByClassName("dump-button") as HTMLCollectionOf<HTMLButtonElement>)
        .forEach((dumpButton: HTMLButtonElement) => {
            dumpButton.disabled = true
        });
}

function enableElementsOnPage() {
    coursesNavHtml.childNodes.forEach((node: ChildNode) => (node as HTMLAnchorElement).classList.remove("disabled"));
    Array.from(document.getElementsByClassName("delete-button") as HTMLCollectionOf<HTMLButtonElement>)
        .forEach((deleteButton: HTMLButtonElement) => {
            deleteButton.disabled = false
        });
    Array.from(document.getElementsByClassName("reset-button") as HTMLCollectionOf<HTMLButtonElement>)
        .forEach((resetButton: HTMLButtonElement) => {
            resetButton.disabled = false
        });
    Array.from(document.getElementsByClassName("dump-button") as HTMLCollectionOf<HTMLButtonElement>)
        .forEach((dumpButton: HTMLButtonElement) => {
            dumpButton.disabled = false
        });
}

async function prepareToDeleteCredentials(dbID: number): Promise<boolean> {
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
    disableElementsOnPage();
    changeNavbarState(false);
    try {
        await axios.delete(`/rest/studentdatabases/${dbID}/`);
        // await changeViewToHaveCredentials()
        addAlert("The database has been successfully deleted", AlertType.primary);
        await changeView(false);
        success = true;
    } catch (error) {
        addErrorAlert(error);
        success = false;
    } finally {
        enableElementsOnPage();
        changeNavbarState(true);
        (navbarStudentView.firstElementChild)!.classList.add("disabled");
    }
    return success;

}

async function resetDatabase(dbID: number): Promise<boolean> {
    const result = await Swal.fire({
        title: 'Are you sure you want to reset this database?',
        text: 'You will not be able to recover your data!',
        type: 'warning',
        showCancelButton: true,
        focusCancel: true,
        confirmButtonText: 'Reset',
        cancelButtonText: 'Cancel'
    });

    if (result.dismiss === Swal.DismissReason.cancel) {
        return false;
    }
    let success: boolean;
    disableElementsOnPage();
    changeNavbarState(false);
    try {
        await axios.post(`/rest/reset/${dbID}/`);
        addAlert("The database has been succesfully reset", AlertType.primary);
        success = true;
    } catch (error) {
        addErrorAlert(error);
        success = false;
    } finally {
        enableElementsOnPage();
        changeNavbarState(true);
        (navbarStudentView.firstElementChild)!.classList.add("disabled");
    }
    return success;
}

window.onload = async () => {
    await Promise.all([
        noCredsForm.addEventListener("submit", (event) => {
            event.preventDefault();
            prepareToGetCredentials();
        }),
        navbarStudentView.classList.add("active"),
        (navbarStudentView.firstElementChild)!.classList.add("disabled"),
        displayCourses(),
        displayWhoami()
    ])
};
