/**
 * student_view.ts:
 * Contains code for the student view page
 */

/**
 * Imports from other files
 */
import {AlertType, Course, StudentDatabase, TA, UserRole, Who} from './interfaces'
import {changePageState, getWhoPromise, initNavbar, navbarStudentView} from "./navbar";
import axios, {AxiosResponse, urlPrefix} from "./main";
import "popper.js"
import "bootstrap"
import {addAlert, addErrorAlert, addTempAlert} from "./alert";
import Swal from 'sweetalert2'
import {getCoursesPromise, goToExistingCoursePane} from "./edit_courses";

/**
 * Constant variable declarations (mostly html elements)
 */
const coursesNavHtml = document.getElementById("courses-nav") as HTMLDivElement,
    noCredsCoursename = document.getElementById("no-credentials-coursename") as HTMLDivElement,
    noCredsInfo = document.getElementById("no-credentials-courseinfo") as HTMLDivElement,
    haveCredsCoursename = document.getElementById("have-credentials-coursename") as HTMLDivElement,
    haveCredsInfo = document.getElementById("have-credentials-courseinfo") as HTMLDivElement,
    credentialsDiv = document.getElementById("credentials-div") as HTMLDivElement,
    haveCredsPane = document.getElementById("have-credentials-pane") as HTMLDivElement,
    noCredsPane = document.getElementById("no-credentials-pane") as HTMLDivElement,
    noCredsForm = document.getElementById("no-credentials-form") as HTMLFormElement,
    credentialsButton = document.getElementById("credentials-button") as HTMLButtonElement,
    groupInput = document.getElementById("group-input") as HTMLInputElement;

/**
 * Global variales that will be changed later on (arrays and such)
 */
let ownDatabases: StudentDatabase[] = [],
    courses: Course[] = [],
    currentCourse = 0,
    who: Who;

/**
 * Populates the pane that shows if the user has no credentials for a course (empties inputs, sets strings and such)
 * @param i Index of the course in the "courses" list
 */
function populateNoCredentialsPane(i: number): void {
    noCredsCoursename.innerText = courses[i].coursename;
    const courseInactiveString = courses[i].active ? "" : "<br><span class='text-danger'>This course is inactive</span>";
    noCredsInfo.innerHTML = courses[i].info + courseInactiveString; // We set innerHTML for this field because we know it is sanitized using html special chars
    groupInput.value = "";
}

/**
 * Populates the pane that shows if the user has credentials
 * @param i Index of the course in the "courses" list
 */
async function populateHaveCredentialsPane(i: number): Promise<void> {
    let credentials = "";
    const dbIDs: number[] = [];
    haveCredsCoursename.innerText = courses[i].coursename;
    const courseInactiveString = courses[i].active ? "" : "<br><span class='text-danger'>This course is inactive</span>";
    haveCredsInfo.innerHTML = courses[i].info + courseInactiveString; // We set innerHTML for this field because we know it is sanitized using html special chars
    ownDatabases.forEach((db: StudentDatabase) => {
        if (db.course === courses[i].courseid) {
            // While pasting a large bit of HTML into the page here is ugly, it allows us to support having more than one DB per course if that is ever needed
            const html = `<div class="mt-5 form-group row">
                            <label class="col-12 col-md-4 col-form-label">Username and DB name:</label>
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
                        <div class="form-group row">
                            <label class="col-12 col-md-4 col-form-label">Example command for connecting:</label>
                            <div class="col-12 col-md-8">
                                <code>psql -h ${document.getElementById("django-template")!.classList[0]!} -U ${db.username} ${db.databasename}</code>
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
                                <button onclick="window.location.replace('${urlPrefix}rest/dump/${db.dbid}/')" id="dump-button-${db.dbid}" class="btn btn-secondary dump-button btn-block">Get dump of database</button>
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

/**
 * Generates an HTML fragment for a nav link
 * @param fromEditCourses If true, this is not being called from the student view so different settings are used
 * @param courseIsActive If false, course is not active, making the link gray
 * @param makeGreen If true, makes the link green (for example, if you have a database for the course)
 * @param i Index of the relevant course in the list of courses
 * @param active If true, the nav-link will have the class "active", making it blue
 * @returns an HTML fragment that can be appended as a child somewhere
 */
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

/**
 * Displays all the courses in the list on the page
 * @param optionalCourses Allows an optional list of courses to be passed. If not used, we use the gloal variable courses
 * @param optionalWho Allows an optional Who to be passed. If not used, we use the gloal variable who
 * @param fromEditCourses If this is not being called from student view, use slightly different settings
 * @param activeI The index of the course that is currently selected in the list "courses"
 */
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
        const youAreTA = taCourses.includes(courses[i].courseid);
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

/**
 * Change the current active pane
 * @param hasCredentials If true, switches to the pane which shows credentials. If false, switches to the request credentials pane
 */
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

/**
 * Try to request course credentials for this course and group
 * @param courseID The course ID
 * @param groupNumber The group number
 * @param alert Whether to add an alert or not
 * @returns whether the the credentials were successfully received
 */
export async function tryGetCredentials(courseID: number, groupNumber: number, alert = true): Promise<boolean> {

    if (courseID !== 0) {
        if (groupNumber > 0) {
            const data = {"course": courseID, "groupid": groupNumber};
            const tempAlert: ChildNode | null = addTempAlert();
            try {
                const response: AxiosResponse<StudentDatabase> = await axios.post("/rest/studentdatabases/", data) as AxiosResponse<StudentDatabase>;
                const database: StudentDatabase = await response.data;
                if (alert) {
                    addAlert(`Database generated for course "${database.course}".<br>
                                                                   Username: "${database.username}"<br>
                                                                   Password: "${database.password}"`, AlertType.success, tempAlert);
                } else {
                    if (tempAlert) {
                        tempAlert.remove();
                    }
                }

                return true;
            } catch (error) {
                addErrorAlert(error, tempAlert)
            }
        } else {
            addAlert("Please enter a valid group number", AlertType.danger)
        }

    } else {
        addAlert("Please select a course", AlertType.danger)
    }
    return false;
}

/**
 * Gets credentials for selected course
 */
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

/**
 * Disables elements on the page
 */
function disableElementsOnPage(): void {
    credentialsButton.disabled = true;
    groupInput.disabled = true;
    Array.from(coursesNavHtml.children).forEach((el: Element) => el.classList.add("disabled"));
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

/**
 * Enables elements on the page
 */
function enableElementsOnPage(): void {
    credentialsButton.disabled = false;
    groupInput.disabled = false;
    Array.from(coursesNavHtml.children).forEach((el: Element) => el.classList.remove("disabled"));
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

/**
 * Deletes studentdatabase, if the user agrees
 * @param dbID ID of the database to delete
 * @returns whether the operation succeeded
 */
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

/**
 * Disable / enable elements on the page
 * @param enable Whether to enable or disable elements
 */
function changeStudentViewState(enable: boolean): void {
    if (enable) {
        enableElementsOnPage();
    } else {
        disableElementsOnPage();
    }
}

/**
 * Tries to reset the studentDatabase, if the user agrees
 * @param dbID The ID of the studentdatabase to delete
 */
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

/**
 * On page load, inits navbar, adds event listeners, populates global variables (see [[Who]] and [[Course]] ),
 * afterwards displays courses. Finally, remoevs spinners.
 */
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
        })()
    ]);
    Array.from(document.getElementsByClassName("spinner-border")).forEach((el: Element) => el.remove())

};
