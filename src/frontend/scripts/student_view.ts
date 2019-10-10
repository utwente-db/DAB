import {getCoursesPromise, StudentDatabase, tryGetCredentials} from './courses'
import {displayWhoami} from "./navbar";
import axios from 'axios';
import "popper.js"
import "bootstrap"
import {addAlert, addErrorAlert, AlertType} from "./alert";
import Swal from 'sweetalert2'

const coursesNavHtml: HTMLDivElement = document.getElementById("courses-nav") as HTMLDivElement;
const coursesContentHtml: HTMLDivElement = document.getElementById("courses-content") as HTMLDivElement;
const noCredsCoursename: HTMLHeadingElement = document.getElementById("no-credentials-coursename") as HTMLDivElement;
const noCredsInfo: HTMLDivElement = document.getElementById("no-credentials-courseinfo") as HTMLDivElement;
const haveCredsCoursename: HTMLHeadingElement = document.getElementById("have-credentials-coursename") as HTMLDivElement;
const haveCredsInfo: HTMLDivElement = document.getElementById("have-credentials-courseinfo") as HTMLDivElement;
const credentialsDiv: HTMLDivElement = document.getElementById("credentials-div") as HTMLDivElement;
const haveCredsPane: HTMLDivElement = document.getElementById("have-credentials-pane") as HTMLDivElement;
const noCredsPane: HTMLHeadingElement = document.getElementById("no-credentials-pane") as HTMLDivElement;


const credentialsButton: HTMLButtonElement = document.getElementById("credentials-button") as HTMLButtonElement;

const groupInput: HTMLInputElement = document.getElementById("group-input") as HTMLInputElement;
const alertDiv: HTMLDivElement = document.getElementById("alert-div") as HTMLDivElement;

let ownDatabases: StudentDatabase[];
let courses: Course[];
let currentCourse = 0;

interface Course {
    courseid: number;
    fid: number;
    coursename: string;
    info: string;
}

function populateNoCredentialsPane(i: number) {
    noCredsCoursename.innerText = courses[i].coursename;
    noCredsInfo.innerText = courses[i].info;
}


async function populateHaveCredentialsPane(i: number) {
    let credentials = "";
    const dbIDs: number[] = [];
    haveCredsCoursename.innerText = courses[i].coursename;
    haveCredsInfo.innerText = courses[i].info;
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
                            <div class="center-block col-12 col-md-6 my-4">
                                <button id="delete-button-${db.dbid}" class="btn btn-danger delete-button ">Delete database and release credentials</button>
                            </div>
                            <div class="center-block col-12 col-md-6 my-4">
                                <button id="reset-button-${db.dbid}" class="btn btn-info  reset-button">Reset database (werkt nog niet)</button>
                            </div>
                        </div>`;
            credentials += html.trim();
            dbIDs.push(db.dbid)
        }
    });
    credentialsDiv.innerHTML = credentials;
    dbIDs.forEach((id: number) => {
        const deleteButton: HTMLButtonElement = document.getElementById(`delete-button-${id}`) as HTMLButtonElement;
        const resetButton: HTMLButtonElement = document.getElementById(`reset-button-${id}`) as HTMLButtonElement;
        deleteButton.addEventListener("click", () => {
            prepareToDeleteCredentials(id)
        });
        deleteButton.addEventListener("click", () => {
            resetDatabase(id)
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
        fragment.firstChild!.addEventListener("click", () => {
            populateNoCredentialsPane(i);
        });
    } else {
        fragment.firstChild!.addEventListener("click", () => {
            populateHaveCredentialsPane(i);
        });
    }

    fragment.firstChild!.addEventListener("click", () => {
        currentCourse = courses[i].courseid;
        alertDiv.innerHTML = "" // Remove all alerts when switching course
    });
    return fragment;
}

async function displayCourses(): Promise<void> {
    courses = await getCoursesPromise();
    ownDatabases = (await axios.get("/rest/studentdatabases/own/")).data as StudentDatabase[];
    // tslint:disable-next-line:variable-name
    const ownCourses = ownDatabases.map((db: StudentDatabase) => db.course);
    console.log(ownCourses);
    const resultNav: string[] = [];

    for (let i = 0; i < courses.length; i++) {
        const haveCredentials = (ownCourses.includes(courses[i].courseid)); // TODO change this later when max databases > 1
        const fragment = createNavLink(haveCredentials, i);

        coursesNavHtml.appendChild(fragment);


    }
}

async function changeViewToHaveCredentials() {
    const activeLink: HTMLLinkElement = document.getElementsByClassName("nav-link active")[0] as HTMLLinkElement;
    const i = Number(activeLink.id);
    const fragment = createNavLink(true, i, true);
    activeLink.classList.remove("active");
    activeLink.insertAdjacentElement("afterend", fragment.firstElementChild!);
    activeLink.remove();
    ownDatabases = (await axios.get("/rest/studentdatabases/own/")).data as StudentDatabase[];
    noCredsPane.classList.remove("active");
    haveCredsPane.classList.add("active");
    populateHaveCredentialsPane(i);
}

async function prepareToGetCredentials() {
    coursesNavHtml.childNodes.forEach((node: ChildNode) => (node as Element).classList.add("disabled"));
    credentialsButton.classList.add("disabled");
    groupInput.classList.add("disabled");
    try {
        await tryGetCredentials(currentCourse, Number(groupInput.value), false);

        await changeViewToHaveCredentials()
    } catch (error) {
        addErrorAlert(error);
    } finally {
        coursesNavHtml.childNodes.forEach((node: ChildNode) => (node as Element).classList.remove("disabled"));
        credentialsButton.classList.remove("disabled");
        groupInput.classList.remove("disabled");
    }
}

async function changeViewToNoCredentials() {
    const activeLink: HTMLLinkElement = document.getElementsByClassName("nav-link active")[0] as HTMLLinkElement;
    const i = Number(activeLink.id);
    const fragment = createNavLink(false, i, true);
    activeLink.classList.remove("active");
    activeLink.insertAdjacentElement("afterend", fragment.firstElementChild!);
    activeLink.remove();
    ownDatabases = (await axios.get("/rest/studentdatabases/own/")).data as StudentDatabase[];
    haveCredsPane.classList.remove("active");
    noCredsPane.classList.add("active");
    populateNoCredentialsPane(i);
}

async function prepareToDeleteCredentials(dbID: number): Promise<boolean> {
    const result = await Swal.fire({
        title: 'Are you sure you want to delete this database?',
        text: 'You will not be able to recover your data!',
        type: 'warning',
        showCancelButton: true,
        confirmButtonText: 'Delete!',
        cancelButtonText: 'Cancel'
    });

    if (result.dismiss === Swal.DismissReason.cancel) {
        return false;
    }
    let success;

    coursesNavHtml.childNodes.forEach((node: ChildNode) => (node as Element).classList.add("disabled"));
    Array.from(document.getElementsByClassName("delete-button") as HTMLCollectionOf<HTMLButtonElement>)
        .forEach((deleteButton: HTMLButtonElement) => {
            deleteButton.classList.add("disabled")
        });
    Array.from(document.getElementsByClassName("reset-button") as HTMLCollectionOf<HTMLButtonElement>)
        .forEach((resetButton: HTMLButtonElement) => {
            resetButton.classList.add("disabled")
        });
    try {
        await axios.delete(`/rest/studentdatabases/${dbID}/`);
        // await changeViewToHaveCredentials()
        addAlert("Deleted database", AlertType.primary);
        changeViewToNoCredentials();
        success = true;
    } catch (error) {
        addErrorAlert(error);
        success = false;
    } finally {
        coursesNavHtml.childNodes.forEach((node: ChildNode) => (node as Element).classList.remove("disabled"));
        Array.from(document.getElementsByClassName("delete-button") as HTMLCollectionOf<HTMLButtonElement>)
            .forEach((deleteButton: HTMLButtonElement) => {
                deleteButton.classList.remove("disabled")
            });
        Array.from(document.getElementsByClassName("reset-button") as HTMLCollectionOf<HTMLButtonElement>)
            .forEach((resetButton: HTMLButtonElement) => {
                resetButton.classList.remove("disabled")
            });
    }
    return success;

}

function resetDatabase(id: number) {
    // TODO implement
}

window.onload = async () => {
    credentialsButton.addEventListener("click", prepareToGetCredentials);
    await displayCourses();
    await displayWhoami();
};
