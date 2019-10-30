import axios, {AxiosResponse} from "./main";
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
const pleaseSelectAuser = document.getElementById("please-select-a-user") as HTMLDivElement;

let deleteButton: HTMLButtonElement = document.getElementById("delete-button") as HTMLButtonElement;
let editButton: HTMLButtonElement = document.getElementById("edit-button") as HTMLButtonElement;
let courses: Course[] = [];

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
        const verified: boolean = users[i].verified;
        result.push(
            `<tr class="user-row poin" id="user-row-${i}"></a>
 <th scope="row">${users[i].id}</th>
             <td>${UserRole[users[i].role]}</td>
             <td>${users[i].email}</td>
             <td>${verified}</td></tr>`.trim()
        );

    }

    const resultString: string = result.join("\n");
    usersHtml.innerHTML = resultString;

    for (let i = 0; i < users.length; i++) {
        document.getElementById(`user-row-${i}`)!.addEventListener("click", () => {
            Array.from(usersTabs.children).forEach((tab: Element) => {
                tab.classList.remove("active")
            });
            editUserPane.classList.add("active");
            // set new course pane active
            Array.from(document.getElementsByTagName('tr'))!.forEach((el: Element) => {
                el.classList.remove("active")
            });
            document.getElementById(`user-row-${i}`)!.classList.add("active");


            const deleteButtonClone = deleteButton!.cloneNode(true) as HTMLButtonElement;
            deleteButton.parentNode!.replaceChild(deleteButtonClone, deleteButton);
            deleteButton = deleteButtonClone;

            const changeRoleButtonClone = editButton!.cloneNode(true) as HTMLButtonElement;
            editButton.parentNode!.replaceChild(changeRoleButtonClone, editButton);
            editButton = changeRoleButtonClone;
            editButton.classList.remove("btn-info");
            editButton.classList.add("btn-secondary");
            editButton.innerHTML = "Edit Role";
            selectedRole.setAttribute("disabled", "");
            editButton.addEventListener("click", () => {
                allowChangeRole(users[i])
            });
            deleteButton.addEventListener("click", () => {
                deleteUser(users[i])
            });
            displayUserDetails(users[i]);
            displayCoursesAndDatabases(users[i]);
        })

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
    const databases: StudentDatabase[] = await getDatabasesPromise(user.id);

    const dbToHTMLmap: Map<StudentDatabase, string> = new Map<StudentDatabase, string>();
    if (databases.length === 0) {
        coursesNavHtml.innerHTML = "This user does not have any databases";
        courseDatabasesHtml.innerHTML = "No database selected";
        return;
    }

    // const coursesAndDatabases = new Map<number, string>();


    for (let i = 0; i < databases.length; i++) {
        const course: Course = courses.find((course: Course) => course.courseid===databases[i].course)!;

        const html =
            `<div class="form-group row">
                <label class="col-12 col-lg-4 col-form-label">Database ID:</label>
                <div class="col-12 col-lg-8">
                    <input type="text" class="form-control" value="${databases[i].dbid}" readonly="">
                </div>
            </div><div class="form-group row">
                <label class="col-12 col-lg-4 col-form-label">Database name:</label>
                <div class="col-12 col-lg-8">
                    <input type="text" class="form-control" value="${databases[i].databasename}" readonly="">
                </div>
            </div><div class="form-group row">
                <label class="col-12 col-lg-4 col-form-label">Username:</label>
                <div class="col-12 col-lg-8">
                    <input type="text" class="form-control" value="${databases[i].username}" readonly="">
                </div>
            </div><div class="form-group row">
                <label class="col-12 col-lg-4 col-form-label">Password:</label>
                <div class="col-12 col-lg-8">
                    <input type="text" class="form-control" value="${databases[i].password}" readonly="">
                </div>
            </div><div class="form-group row">
                <label class="col-12 col-lg-4 col-form-label">Group ID:</label>
                <div class="col-12 col-lg-8">
                    <input type="text" class="form-control" value="${databases[i].groupid}" readonly="">
                </div>
            </div><div class="form-group row">
                <label class="col-12 col-lg-4 col-form-label">Owner ID:</label>
                <div class="col-12 col-lg-8">
                    <input type="text" class="form-control" value="${databases[i].fid}" readonly="">
                </div>
            </div><div class="form-group row">
                <label class="col-12 col-lg-4 col-form-label">Course ID:</label>
                <div class="col-12 col-lg-8">
                    <input type="text" class="form-control" value="${databases[i].course}" readonly="">
                </div>
            </div>
            <div class="form-group row">
                <label class="col-12 col-lg-4 col-form-label">Course name:</label>
                <div class="col-12 col-lg-8">
                    <input type="text" class="form-control" value="${course.coursename}" readonly="">
                </div>
            </div>
            
            
                                    
                        
                        
            
            <div class="align-items-center align-items-stretch row">
            <div class="center-block col-12 col-md-4 my-2 my-md-4 d-flex">
            <button type="button" class="btn btn-secondary " onclick="window.location.replace('/rest/dump/${databases[i].dbid}/')">
                Download dump
                
            </button>
            </div><div class="center-block col-12 col-md-4 my-2 my-md-4 d-flex">
            <button id="reset-button-${databases[i].dbid}" type="button" class="btn btn-info ">
                Reset database
            </button>
            </div><div class="center-block col-12 col-md-4 my-2 my-md-4 d-flex">
            <button id="delete-button-${databases[i].dbid}" type="button" class="btn btn-danger">
                Delete database
            </button>
            </div>
            </div>`.trim();


        // This will mess up if someone has multiple db's for a single course
        dbToHTMLmap.set(databases[i], html);

    }

    const resultNav: string[] = [];
    const resultContent: string[] = [];
    let active = " active";
    for (const entry of Array.from(dbToHTMLmap.entries())) {
        const db: StudentDatabase = entry[0];

        const content: string = entry[1];

        resultNav.push(
            `<a class="studentdatabase-link nav-link${active}" data-toggle="pill" href="#db-${db.dbid}">${db.databasename}</a>`
        );
        resultContent.push(
            `<div class="tab-pane${active}" id="db-${db.dbid}">${content}</div>`
        );
        active = "";
    }
    const resultNavString: string = resultNav.join("\n");
    const resultContentString: string = resultContent.join("\n");
    coursesNavHtml.innerHTML = resultNavString;
    courseDatabasesHtml.innerHTML = resultContentString;

    databases.forEach((db: StudentDatabase) => {
        const resetButton: HTMLButtonElement = document.getElementById(`reset-button-${db.dbid}`) as HTMLButtonElement;
        resetButton.addEventListener("click", () => {
            resetDatabase(db.dbid);
        });
        const deleteButton: HTMLButtonElement = document.getElementById(`delete-button-${db.dbid}`) as HTMLButtonElement;
        deleteButton.addEventListener("click", () => {
            deleteDatabase(db.dbid, courseDatabasesHtml);
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

        Array.from(usersTabs.children).forEach((tab: Element) => {
            tab.classList.remove("active")
        });
        pleaseSelectAuser.classList.add("active");
        document.getElementsByClassName("user-row active")[0]!.remove();
        // TODO remove table row
        // window.location.href = '../';
        success = true;
    } catch (error) {
        addErrorAlert(error);
        success = false;
    }
    return success;
}

function allowChangeRole(user: User): void {
    editButton.classList.remove("btn-secondary");
    editButton.classList.add("btn-info");
    editButton.innerHTML = "Save changes";
    selectedRole.removeAttribute("disabled");
    const editButtonClone = editButton!.cloneNode(true) as HTMLButtonElement;
    editButton.parentNode!.replaceChild(editButtonClone, editButton);
    editButton = editButtonClone;
    editButton.addEventListener("click", () => changeRole(user))
}

async function changeRole(user: User): Promise<boolean> {
    const roleNumber: number = Number(selectedRole.value);
    if (user.role === roleNumber) {
        const changeRoleButtonClone = editButton!.cloneNode(true) as HTMLButtonElement;
        editButton.parentNode!.replaceChild(changeRoleButtonClone, editButton);
        editButton = changeRoleButtonClone;
        editButton.classList.remove("btn-info");
        editButton.classList.add("btn-secondary");
        editButton.innerHTML = "Edit Role";
        selectedRole.setAttribute("disabled", "");
        editButton.addEventListener("click", () => {
            allowChangeRole(user)
        });
        return true;
    }
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
        (document.getElementsByClassName("user-row active")[0]!.children[1]! as HTMLAnchorElement).innerHTML = UserRole[roleNumber];
        const changeRoleButtonClone = editButton!.cloneNode(true) as HTMLButtonElement;
        editButton.parentNode!.replaceChild(changeRoleButtonClone, editButton);
        editButton = changeRoleButtonClone;
        editButton.classList.remove("btn-info");
        editButton.classList.add("btn-secondary");
        editButton.innerHTML = "Edit Role";
        selectedRole.setAttribute("disabled", "");
        editButton.addEventListener("click", () => {
            allowChangeRole(user)
        });
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
        courses = await getCoursesPromise(),
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
