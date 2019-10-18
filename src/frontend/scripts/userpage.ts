import axios, {AxiosResponse} from 'axios';

import * as $ from "jquery";
import "popper.js";
import "bootstrap";
import {addAlert, addErrorAlert, AlertType} from "./alert";
import Swal from 'sweetalert2';

import {displayWhoami} from "./navbar";

const urlParams = new URLSearchParams(window.location.search);
var userid: number = 0;

// let user: User;
// let databases: Database[];

const x: string | null = urlParams.get("id");
if (x != null) {
    userid = parseInt(x);
}

const pageTitleHtml: HTMLTitleElement = document.getElementById("page-title") as HTMLTitleElement;
const userInfoHtml: HTMLDivElement = document.getElementById("user-info") as HTMLDivElement;

const coursesNavHtml: HTMLDivElement = document.getElementById("courses-nav") as HTMLDivElement;
const courseDatabasesHtml: HTMLDivElement = document.getElementById("courses-db") as HTMLDivElement;

const usernameHtml: HTMLDivElement = document.getElementById("username") as HTMLDivElement;
const roleHtml: HTMLDivElement = document.getElementById("role") as HTMLDivElement;
const verifiedHtml: HTMLLabelElement = document.getElementById("verified") as HTMLLabelElement;

const deleteButton: HTMLButtonElement = document.getElementById("delete_button") as HTMLButtonElement;
const changeRoleButton: HTMLButtonElement = document.getElementById("change_role") as HTMLButtonElement;

interface User {
    id: number;
    role: number;
    email: string;
    verified: boolean;
}

interface Course {
    courseid: number;
    fid: number;
    coursename: string;
    info: string;
}

interface Database {
    dbid: number;
    databasename: string;
    username: string;
    password: string;
    groupid: number;
    fid: number;
    course: number;
}

async function getDatabasesPromise(): Promise<Database[]> {
    const response: AxiosResponse = await axios.get("/rest/studentdatabases/owner/" + userid + "/");
    return response.data;
}

async function getCourseByIDPromise(id: number): Promise<Course> {
    const response: AxiosResponse = await axios.get("/rest/courses/" + id + "/");
    return response.data;
}

async function getUserPromise(): Promise<User> {
    const path: string = `/rest/dbmusers/${userid}/`;
    const response: AxiosResponse = await axios.get(path);
    return response.data;
}

async function displayCoursesAndDatabases(): Promise<void> {
    const databases: Database[] = await getDatabasesPromise();

    if (databases.length == 0) {
        coursesNavHtml.innerHTML = "empty";
        courseDatabasesHtml.innerHTML = "no content";
        return;
    }

    const coursesAndDatabases = new Map<number, string>();

    for (let i = 0; i < databases.length; i++) {
        coursesAndDatabases.set(databases[i].course, "");
    }

    for (let i = 0; i < databases.length; i++) {
        const html: string = "dbid: " + databases[i].dbid + "<br>"
            + "databasename: " + databases[i].databasename + "<br>"
            + "username: " + databases[i].username + "<br>"
            + "password: " + databases[i].password + "<br>"
            + "groupid: " + databases[i].groupid + "<br>"
            + "fid: " + databases[i].fid + "<br>"
            + "course: " + databases[i].course + "<br>";

        // This will mess up if someone has multiple db's in a single course
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
            "<a class=\"nav-link" + active + "\" data-toggle=\"pill\" href=\"#course" + course.courseid + "\">" + course.coursename + "</a>"
        );
        resultContent.push(
            "<div class=\"tab-pane" + active + "\" id=\"course" + course.courseid + "\">"
            + content
            + "test</div>"
        );
        active = "";
    }
    const resultNavString: string = resultNav.join("\n");
    const resultContentString: string = resultContent.join("\n");
    coursesNavHtml.innerHTML = resultNavString;
    courseDatabasesHtml.innerHTML = resultContentString;
}

async function displayUserDetails(): Promise<void> {
    const user: User = await getUserPromise();
    pageTitleHtml.innerHTML += "Admin - User " + user.id;

    let role: string;
    if (user.role == 0) {
        role = "admin";
    } else if (user.role == 1) {
        role = "teacher";
    } else if (user.role == 2) {
        role = "student";
    } else {
        role = "unknown";
    }

    usernameHtml.innerHTML += `<input type=\"text\" class=\"form-control\" value=\"${user.email}\" readonly="">`;
    roleHtml.innerHTML += `<input type="text" class="form-control" value="${role}" readonly="">`;
    verifiedHtml.innerHTML += (user.verified ? "<span>&#x2714</span>" : "<span>&#x2718</span>");
}

async function deleteUser(): Promise<boolean> {
    const user: User = await getUserPromise();
    const result = await Swal.fire({
        title: `Are you sure you want to delete <strong>${user.email}<strong> from the system?`,
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
        await axios.delete(`/rest/dbmusers/${userid}/`);
        alert("User succesfully deleted!");
        window.location.href = '../';
        success = true;
    } catch (error) {
        addErrorAlert(error);
        success = false;
    }
    return success;
}

async function changeRole(): Promise<boolean> {
    const user: User = await getUserPromise();
    // TODO correctly find selected option
    const selectedRole: HTMLSelectElement = document.getElementById("change_role") as HTMLSelectElement;
    const role: string = selectedRole.value;
    const result = await Swal.fire({
        text: `Are you sure you want change the role of <strong>${user.email}</strong> to ${role}?`,
        type: 'warning',
        showCancelButton: true,
        confirmButtonText: 'Confirm',
        cancelButtonText: 'Cancel'
    });

    if (result.dismiss === Swal.DismissReason.cancel) {
        return false;
    }
    let success;

    try {
        await axios.post(`/rest/set_role/`, {"user": user.id, "role": role});
        addAlert("Role changed!", AlertType.primary);
        success = true;
    } catch (error) {
        addErrorAlert(error);
        success = false;
    }
    return success;
}

window.onload = async () => {
    await Promise.all([
        changeRoleButton.addEventListener("click", changeRole),
        deleteButton.addEventListener("click", deleteUser),
        await displayUserDetails(),
        await displayWhoami(),
        await displayCoursesAndDatabases()
    ]);
}
