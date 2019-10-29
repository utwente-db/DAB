import axios, {AxiosResponse} from 'axios';
import "popper.js";
import "bootstrap";
import {addAlert, addErrorAlert, AlertType} from "./alert";
import Swal from 'sweetalert2';

import {initNavbar, navbarEditUsers} from "./navbar";
import {Course, getCoursesPromise, StudentDatabase} from "./courses";

const urlParams = new URLSearchParams(window.location.search);

let users: User[];
// let user: User;
// let databases: Database[];

const x: string | null = urlParams.get("id");
const usersHtml: HTMLTableSectionElement = document.getElementById("users") as HTMLTableSectionElement;

const pageTitleHtml: HTMLTitleElement = document.getElementById("page-title") as HTMLTitleElement;
const userInfoHtml: HTMLDivElement = document.getElementById("user-info") as HTMLDivElement;

const coursesNavHtml: HTMLDivElement = document.getElementById("courses-nav") as HTMLDivElement;
const courseDatabasesHtml: HTMLDivElement = document.getElementById("courses-db") as HTMLDivElement;


const usernameHtml = document.getElementById("username") as HTMLInputElement;
const selectedRole = document.getElementById("selected-role") as HTMLSelectElement;
const verifiedHtml: HTMLLabelElement = document.getElementById("verified") as HTMLLabelElement;
const searchInput = document.getElementById("search") as HTMLInputElement;
const usersTbody = document.getElementById("users") as HTMLTableSectionElement;
const usersTabs = document.getElementById("users-tabs") as HTMLDivElement;
const editUserPane = document.getElementById("edit-user-pane") as HTMLDivElement;

let deleteButton: HTMLButtonElement = document.getElementById("delete-button") as HTMLButtonElement;
let editButton: HTMLButtonElement = document.getElementById("edit-button") as HTMLButtonElement;


export interface User {
    id: number;
    role: number;
    email: string;
    password: string;
    verified: boolean;
    token: string;
}

export enum UserRole {
    Admin = 0,
    Teacher = 1,
    Student = 2
}

export interface TA {
    courseid: number,
    studentid: number,
    taid: number
}

async function displayUsers(): Promise<void> {
    users = (await getUsersPromise()).sort((a: User, b: User) => a.email.localeCompare(b.email));

    const result: string[] = [];

    for (let i = 0; i < users.length; i++) {
        let role: string;
        if (users[i].role === 0) {
            role = "Admin";
        } else if (users[i].role === 1) {
            role = "Teacher";
        } else if (users[i].role === 2) {
            role = "Student";
        } else {
            role = "Unknown";
        }

        const verified: boolean = users[i].verified;
        result.push(
            `<tr id="user-row-${i}">
 <th scope="row">${users[i].id}</th>
             <td><a class="user-link-${i}" style="display:block; height:100%; width:100%" href='#'>${role}</td>
             <td><a class="user-link-${i}" style="display:block; height:100%; width:100%" href='#'>${users[i].email}</td>
             <td><a class="user-link-${i}" style="display:block; height:100%; width:100%" href='#'>${verified}</td></tr>`.trim()
        );

    }

    const resultString: string = result.join("\n");
    usersHtml.innerHTML = resultString;

    for (let i = 0; i < users.length; i++) {
        const links = document.getElementsByClassName(`user-link-${i}`) as HTMLCollectionOf<HTMLAnchorElement>;
        for (let j = 0; j < links.length; j++) {
            links.item(j)!.addEventListener("click", () => {
                Array.from(usersTabs.children).forEach((tab: Element) => {
                    tab.classList.remove("active")
                });
                editUserPane.classList.add("active");
                // set new course pane active
                Array.from(document.getElementsByTagName('tr'))!.forEach((el: Element) => {
                    el.classList.remove("active")
                })
                document.getElementById(`user-row-${i}`)!.classList.add("active");

                const changeRoleButtonClone = editButton!.cloneNode(true) as HTMLButtonElement;
                editButton.parentNode!.replaceChild(changeRoleButtonClone, editButton);
                editButton = changeRoleButtonClone;

                const deleteButtonClone = deleteButton!.cloneNode(true) as HTMLButtonElement;
                deleteButton.parentNode!.replaceChild(deleteButtonClone, deleteButton);
                deleteButton = deleteButtonClone;


                editButton.addEventListener("click", () => {
                    changeRole(users[i])
                });
                deleteButton.addEventListener("click", () => {
                    deleteUser(users[i])
                });
                displayUserDetails(users[i]);
                displayCoursesAndDatabases(users[i]);
            })
        }

    }
}

export async function getUsersPromise(): Promise<User[]> {
    const response: AxiosResponse = await axios.get("/rest/dbmusers/");
    return response.data;
}

async function getDatabasesPromise(userid: number): Promise<StudentDatabase[]> {
    const response: AxiosResponse = await axios.get(`/rest/studentdatabases/owner/${userid}/`);
    return response.data;
}

async function getCourseByIDPromise(id: number): Promise<Course> {
    const response: AxiosResponse = await axios.get(`/rest/courses/${id}/`);
    return response.data;
}

// async function getUserPromise(userid: number): Promise<User> {
//     const path = `/rest/dbmusers/${userid}/`;
//     const response: AxiosResponse = await axios.get(path);
//     return response.data;
// }

async function displayCoursesAndDatabases(user: User): Promise<void> {
    const dbIDs: number[] = [];
    const databases: StudentDatabase[] = await getDatabasesPromise(user.id);

    const coursesAndDatabases: Map<number, string> = new Map<number, string>();
    if (databases.length === 0) {
        coursesNavHtml.innerHTML = "This user does not have any databases";
        courseDatabasesHtml.innerHTML = "No database selected";
        return;
    }

    // const coursesAndDatabases = new Map<number, string>();

    for (let i = 0; i < databases.length; i++) {
        coursesAndDatabases.set(databases[i].course, "");
    }

    for (let i = 0; i < databases.length; i++) {
        dbIDs.push(databases[i].dbid);
        const html: string =
            `<div class="form-group row">
                <label class="col-12 col-lg-4 col-form-label">Database ID:</label>
                <div class="col-12 col-lg-8">
                    <input type="text" class="form-control" value="${databases[i].dbid}" readonly="">
                </div>
            </div>` +
            `<div class="form-group row">
                <label class="col-12 col-lg-4 col-form-label">Database name:</label>
                <div class="col-12 col-lg-8">
                    <input type="text" class="form-control" value="${databases[i].databasename}" readonly="">
                </div>
            </div>` +
            `<div class="form-group row">
                <label class="col-12 col-lg-4 col-form-label">Username:</label>
                <div class="col-12 col-lg-8">
                    <input type="text" class="form-control" value="${databases[i].username}" readonly="">
                </div>
            </div>` +
            `<div class="form-group row">
                <label class="col-12 col-lg-4 col-form-label">Password:</label>
                <div class="col-12 col-lg-8">
                    <input type="text" class="form-control" value="${databases[i].password}" readonly="">
                </div>
            </div>` +
            `<div class="form-group row">
                <label class="col-12 col-lg-4 col-form-label">Group ID:</label>
                <div class="col-12 col-lg-8">
                    <input type="text" class="form-control" value="${databases[i].groupid}" readonly="">
                </div>
            </div>` +
            `<div class="form-group row">
                <label class="col-12 col-lg-4 col-form-label">FID:</label>
                <div class="col-12 col-lg-8">
                    <input type="text" class="form-control" value="${databases[i].fid}" readonly="">
                </div>
            </div>` +
            `<div class="form-group row">
                <label class="col-12 col-lg-4 col-form-label">Course ID:</label>
                <div class="col-12 col-lg-8">
                    <input type="text" class="form-control" value="${databases[i].course}" readonly="">
                </div>
            </div>` +
            `<button type="button" class="btn btn-danger" onclick="window.location.replace('/rest/dump/${databases[i].dbid}/')">
                Download Dump
            </button>` +
            `<button id="reset-button-${databases[i].dbid}" type="button" class="btn btn-danger">
                Reset
            </button>` +
            `<button id="delete-button-${databases[i].dbid}" type="button" class="btn btn-danger">
                Delete
            </button>`

        ;

        // This will mess up if someone has multiple db's for a single course
        coursesAndDatabases.set(databases[i].course, html);
    }

    const resultNav: string[] = [];
    const resultContent: string[] = [];
    let active = " active";
    for (const entry of Array.from(coursesAndDatabases.entries())) {
        const courseNumber: number = entry[0];
        const content: string = entry[1];
        const course: Course = await getCourseByIDPromise(courseNumber);
        resultNav.push(
            `<a class="studentdatabase-link nav-link${active}" data-toggle="pill" href="#course${course.courseid}">${course.coursename}</a>`
        );
        resultContent.push(
            `<div class="tab-pane${active}" id="course${course.courseid}">${content}</div>`
        );
        active = "";
    }
    const resultNavString: string = resultNav.join("\n");
    const resultContentString: string = resultContent.join("\n");
    coursesNavHtml.innerHTML = resultNavString;
    courseDatabasesHtml.innerHTML = resultContentString;

    dbIDs.forEach((id: number) => {
        const resetButton: HTMLButtonElement = document.getElementById(`reset-button-${id}`) as HTMLButtonElement;
        resetButton.addEventListener("click", () => {
            resetDatabase(id);
        });
        const deleteButton: HTMLButtonElement = document.getElementById(`delete-button-${id}`) as HTMLButtonElement;
        deleteButton.addEventListener("click", () => {
            deleteDatabase(id, courseDatabasesHtml);
        });
    });

}

export async function deleteDatabase(dbID: number, dbDiv: HTMLDivElement): Promise<boolean> {
    const result = await Swal.fire({
        title: 'Are you sure you want to delete this database?',
        text: 'You will not be able to recover your data!',
        type: 'warning',
        showCancelButton: true,
        confirmButtonText: 'Delete',
        cancelButtonText: 'Cancel'
    });

    if (result.dismiss === Swal.DismissReason.cancel) {
        return false;
    }
    let success;
    try {
        await axios.delete(`/rest/studentdatabases/${dbID}/`);
        addAlert("Deleted database", AlertType.primary);
        document.getElementsByClassName("studentdatabase-link nav-link active")[0].remove();
        dbDiv.innerHTML = "No database selected";
        success = true;
        // window.location.reload(true);
    } catch (error) {
        addErrorAlert(error);
        success = false;
    }
    return success;
}

// Internal server error 500?
export async function resetDatabase(dbID: number): Promise<boolean> {
    const result = await Swal.fire({
        title: 'Are you sure you want to reset this database?',
        text: 'You will not be able to recover your data!',
        type: 'warning',
        showCancelButton: true,
        cancelButtonText: 'Cancel',
        confirmButtonText: 'Reset'
    });
    if (result.dismiss === Swal.DismissReason.cancel) {
        return false;
    }
    let success;
    try {
        await axios.post(`/rest/reset/${dbID}/`);
        addAlert("Reset database", AlertType.primary);
        success = true;
    } catch (error) {
        addErrorAlert(error);
        success = false;
    }
    return success;
}

async function displayUserDetails(user: User): Promise<void> {
    pageTitleHtml.innerHTML = `Admin - User ${user.id}`;

    // let role: string;
    // if (user.role === UserRole.admin) {
    //     role = "Admin";
    // } else if (user.role === UserRole.teacher) {
    //     role = "Teacher";
    // } else if (user.role === UserRole.student) {
    //     role = "Student";
    // } else {
    //     role = "unknown";
    // }

    usernameHtml.value = user.email;
    selectedRole.value = String(user.role);
    verifiedHtml.innerHTML = (user.verified ? "<span>&#x2714</span>" : "<span>&#x2718</span>");
}

async function deleteUser(user: User): Promise<boolean> {
    const result = await Swal.fire({
        text: `Are you sure you want to delete ${user.email} from the system?`,
        type: 'warning',
        showCancelButton: true,
        focusCancel: true,
        confirmButtonText: 'Delete',
        cancelButtonText: 'Cancel'
    });

    if (result.dismiss === Swal.DismissReason.cancel) {
        return false;
    }
    let success;

    try {
        await axios.delete(`/rest/dbmusers/${user.id}/`);
        addAlert("User succesfully deleted!", AlertType.success);
        // window.location.href = '../';
        success = true;
    } catch (error) {
        addErrorAlert(error);
        success = false;
    }
    return success;
}

async function changeRole(user: User): Promise<boolean> {
    const roleNumber: number = Number(selectedRole.value);

    const result = await Swal.fire({
        text: `Are you sure you want change the role of ${user.email} to ${UserRole[roleNumber]}?`,
        type: 'warning',
        showCancelButton: true,
        focusCancel: true,
        confirmButtonText: 'Confirm',
        cancelButtonText: 'Cancel'
    });

    if (result.dismiss === Swal.DismissReason.cancel) {
        return false;
    }
    let success;

    try {
        await axios.post(`/rest/set_role`, {
            user: user.id,
            role: roleNumber
        });
        addAlert(`Role of ${user.email} was changed to ${UserRole[roleNumber]}!`, AlertType.primary);
        user.role = roleNumber;
        success = true;
    } catch (error) {
        addErrorAlert(error);
        success = false;
    }
    return success;
}

function changeEditUserState(enable: boolean): void {
    return;
}


window.onload = async () => {
    await Promise.all([
        initNavbar(changeEditUserState),
        displayUsers(),
        navbarEditUsers.classList.add("active"),
        (navbarEditUsers.firstElementChild)!.classList.add("disabled"),

    ]);

    searchInput.addEventListener("keyup", () => {
        const value = searchInput.value.toLowerCase();
        Array.from(usersTbody.children).forEach((child: Element) => {
            const childRow = child as HTMLTableRowElement;
            childRow.hidden = !childRow.textContent!.toLowerCase().includes(value);
        });
    });


}
