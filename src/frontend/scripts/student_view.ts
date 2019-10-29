import {Course, getCoursesPromise, StudentDatabase, tryGetCredentials} from './courses'
import {changePageState, displayWhoami, getWhoPromise, initNavbar, navbarStudentView, Who} from "./navbar";
import axios, {AxiosResponse} from 'axios';
import "popper.js"
import "bootstrap"
import {addAlert, addErrorAlert, AlertType} from "./alert";
import Swal from 'sweetalert2'
import {TA, UserRole} from "./user";
import {goToExistingCoursePane} from "./edit_courses";

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

function populateNoCredentialsPane(i: number): void {
    noCredsCoursename.innerText = courses[i].coursename;
    const courseInactiveString = courses[i].active ? "" : "<br><span class='text-danger'>This course is inactive</span>"
    noCredsInfo.innerHTML = courses[i].info + courseInactiveString; // We set innerHTML for this field because we know it is sanitized using html special chars
    groupInput.value = "";
}


async function populateHaveCredentialsPane(i: number): Promise<void> {
    let credentials = "";
    const dbIDs: number[] = [];
    haveCredsCoursename.innerText = courses[i].coursename;
    const courseInactiveString = courses[i].active ? "" : "<br><span class='text-danger'>This course is inactive</span>"
    haveCredsInfo.innerHTML = courses[i].info + courseInactiveString // We set innerHTML for this field because we know it is sanitized using html special chars
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

export function createNavLink(fromEditCourses: boolean, courseIsActive: boolean, makeGreen: boolean, i: number, active = false): DocumentFragment {
    let credentialsClass: string;
    let hrefString: string;
    let inactiveCourseString: string;
    let activeString: string;
    if (fromEditCourses) {
        hrefString = "";
    } else {
        hrefString = makeGreen ? "have-credentials-pane" : "no-credentials-pane";
    }
    credentialsClass = makeGreen ? "green-nav" : "not-green-nav";
    activeString = active ? "active" : "";
    inactiveCourseString = courseIsActive ? "" : "inactive-course";


    const templateString = `<a id="${i}" class="course-link nav-link ${credentialsClass} ${activeString} ${inactiveCourseString}" data-toggle="pill" href="#${hrefString}">${courses[i].coursename}</a>`;
    const fragment: DocumentFragment = document.createRange().createContextualFragment(templateString);

    if (fromEditCourses) {
        fragment.firstElementChild!.addEventListener("click", (event) => {
            event.preventDefault();
            goToExistingCoursePane(i);
        });

    } else {
        if (!makeGreen) {
            fragment.firstElementChild!.addEventListener("click", () => {
                populateNoCredentialsPane(i);
            });
        } else {
            fragment.firstElementChild!.addEventListener("click", () => {
                populateHaveCredentialsPane(i);
            });
        }
    }

    fragment.firstElementChild!.addEventListener("click", () => {
        currentCourse = courses[i].courseid;
    });
    return fragment;
}

export async function displayCourses(optionalCourses?: Course[], optionalWho?: Who, fromEditCourses = false, activeI = -1): Promise<void> {

    if (optionalCourses) {
        courses = optionalCourses;
    }

    if (optionalWho) {
        who = optionalWho;
    }

    if (!fromEditCourses) {
        ownDatabases = await (await axios.get("/rest/studentdatabases/own/")).data as StudentDatabase[];
    } else {
        ownDatabases = [];
    }

    let taCourses: number[] = [];
    if (who.role === UserRole.Student) {
        const taResponse: AxiosResponse<TA[]> = await axios.get("/rest/tas/own/") as AxiosResponse<TA[]>;
        const taList: TA[] = taResponse.data;
        taCourses = taList.map((ta: TA) => ta.courseid);
    }


    // tslint:disable-next-line:variable-name
    const ownCourses = ownDatabases.map((db: StudentDatabase) => db.course);
    for (let i = 0; i < courses.length; i++) {
        let youHavePrivilege = false;
        const youAreTA = taCourses.includes(courses[i].courseid)
        if (fromEditCourses) {
            youHavePrivilege = (who.role === UserRole.Admin || (who.role === UserRole.Teacher && courses[i].fid === who.id) || youAreTA);

        } else {
            youHavePrivilege = (courses[i].active || who.role === UserRole.Admin || (who.role === UserRole.Teacher && courses[i].fid === who.id) || youAreTA);

        }
        if (youHavePrivilege) {
            let haveCredentials = false;
            if (who.role === UserRole.Admin && fromEditCourses) {
                haveCredentials = courses[i].fid === who.id // The user owns this course
            } else if (!fromEditCourses) {
                haveCredentials = (ownCourses.includes(courses[i].courseid));
            }
            const fragment = createNavLink(fromEditCourses, courses[i].active, haveCredentials, i, i === activeI);

            coursesNavHtml.appendChild(fragment);
        }


    }
}

async function changeView(hasCredentials: boolean): Promise<void> {
    const activeLink: HTMLAnchorElement = document.getElementsByClassName("course-link nav-link active")[0] as HTMLAnchorElement;
    const oldPane = hasCredentials ? noCredsPane : haveCredsPane;
    const newPane = hasCredentials ? haveCredsPane : noCredsPane;
    const i = Number(activeLink.id);
    const fragment = createNavLink(false, courses[i].active, hasCredentials, i, true);
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

async function prepareToGetCredentials(): Promise<void> {
    disableElementsOnPage();
    try {
        const success = await tryGetCredentials(currentCourse, Number(groupInput.value), false);

        if (success) {
            await changeView(true);
        }

    } catch (error) {
        addErrorAlert(error);
    } finally {
        enableElementsOnPage();
    }
}


function disableElementsOnPage(): void {
    credentialsButton.disabled = true;
    groupInput.disabled = true;
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

function enableElementsOnPage(): void {
    credentialsButton.disabled = false;
    groupInput.disabled = false;
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
    (navbarStudentView.firstElementChild)!.classList.add("disabled");

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
    changePageState(false, changeStudentViewState);
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
        changePageState(true, changeStudentViewState);
    }
    return success;

}

function changeStudentViewState(enable: boolean): void {
    if (enable) {
        enableElementsOnPage();
    } else {
        disableElementsOnPage();
    }
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
    changePageState(false, changeStudentViewState);
    try {
        await axios.post(`/rest/reset/${dbID}/`);
        addAlert("The database has been succesfully reset", AlertType.primary);
        success = true;
    } catch (error) {
        addErrorAlert(error);
        success = false;
    } finally {
        changePageState(true, changeStudentViewState);
    }
    return success;
}

window.onload = async () => {

    await Promise.all([
        initNavbar(changeStudentViewState),
        noCredsForm.addEventListener("submit", (event) => {
            event.preventDefault();
            prepareToGetCredentials();
        }),
        navbarStudentView.classList.add("active"),
        (navbarStudentView.firstElementChild)!.classList.add("disabled"),
        (async () => {
            who = await getWhoPromise();

            courses = (await getCoursesPromise()).sort((a: Course, b: Course) => a.coursename.localeCompare(b.coursename));
            await displayCourses();
        })(),
        displayWhoami()
    ])
};
