import axios, {AxiosResponse} from 'axios';

// TODO uncomment these when needed, but never ship the product with the entirety of jquery and bootstrap in main.js
import * as $ from "jquery";
import "popper.js"
import "bootstrap"
import "bootstrap-select"
<<<<<<< HEAD
// import "../sass/desktop.sass"

const usersHtml: HTMLTableSectionElement = document.getElementById("users") as HTMLTableSectionElement;
const coursesNavHtml: HTMLDivElement = document.getElementById("courses-nav") as HTMLDivElement;
const coursesContentHtml: HTMLDivElement = document.getElementById("courses-content") as HTMLDivElement;
const whoamiWelcomeHtml: HTMLDivElement = document.getElementById("whoamiWelcome") as HTMLDivElement;
const whoamiButtonHtml: HTMLDivElement = document.getElementById("whoamiButton") as HTMLDivElement;

interface Whoami {
    id: number;
    email: string;
    role: number;
    cached_role: number;
}
=======
import "../sass/desktop.sass"

const usersHtml: HTMLDivElement = document.getElementById("users") as HTMLDivElement;
const coursesNavHtml: HTMLDivElement = document.getElementById("courses-nav") as HTMLDivElement;
const coursesContentHtml: HTMLDivElement = document.getElementById("courses-content") as HTMLDivElement;
>>>>>>> master

interface User {
    id: number;
    role: number;
    email: string;
    password: string;
    maxdatabases: number;
    verified: boolean;
    token: string;
}

interface Course {
    courseid: number;
    fid: number;
    coursename: string;
    info: string;
}

<<<<<<< HEAD
async function getWhoamiPromise(): Promise<Whoami> {
    const response: AxiosResponse = await axios.get("/rest/whoami/");
    return response.data;
}

async function getCoursesPromise(): Promise<Course[]> {
    const response: AxiosResponse = await axios.get("/rest/courses/");
=======
async function getCoursesPromise(): Promise<Course[]> {
    const response: AxiosResponse = await axios.get("/rest/courses");
>>>>>>> master
    return response.data;
}

async function getUsersPromise(): Promise<User[]> {
    const response: AxiosResponse = await axios.get("/rest/dbmusers/");
    return response.data;
}

<<<<<<< HEAD
async function displayWhoami(): Promise<void> {
    const whoami: Whoami = await getWhoamiPromise();
    whoamiWelcomeHtml.innerHTML += "Welcome " + whoami.email;
    whoamiButtonHtml.innerHTML += "<button class=\"btn btn-secondary my-2 my-sm-0\" href=\"/settings" + whoami.id + "\">Settings</button>";
}

=======
>>>>>>> master
async function displayCourses(): Promise<void> {
    const courses: Course[] = await getCoursesPromise();
    const resultNav: string[] = [];
    const resultContent: string[] = [];

    for (let i = 0; i < courses.length; i++) {
        let active: string = "";
        if (i == 0) {
            active = " active";
        }
        resultNav.push(
            "<a class=\"nav-link" + active + "\" data-toggle=\"pill\" href=\"#course" + i + "\">" + courses[i].coursename + "</a>"
        );
        resultContent.push(
<<<<<<< HEAD
            "<div class=\"tab-pane" + active + "\" id=\"course" + i + "\">"
            + "<ul><li>ID: " + courses[i].courseid + "</li>"
            + "<li>FID: " + courses[i].fid + "</li>"
            + "<li>Coursename: " + courses[i].coursename + "</li>"
            + "<li>Info: " + courses[i].info + "</li></ul>"
            + "<button class=\"btn btn-secondary\" href=\"/courses#" + courses[i].courseid + "\">Edit Course</button></div>"
=======
            "<ul><li>" + courses[i].courseid + "</li>"
            + "<li>" + courses[i].fid + "</li>"
            + "<li>" + courses[i].coursename + "</li>"
            + "<li>" + courses[i].info + "</li></ul>"
>>>>>>> master
        );
    }
    const resultNavString: string = resultNav.join("\n");
    const resultContentString: string = resultContent.join("\n");
    coursesNavHtml.innerHTML += resultNavString;
    coursesContentHtml.innerHTML += resultContentString;
}

async function displayUsers(): Promise<void> {
    const users: User[] = await getUsersPromise();
    const result: string[] = [];
    for (let i = 0; i < users.length; i++) {
        let role: string;
        if (users[i].role == 0) {
            role = "Admin";
        } else if (users[i].role == 1) {
            role = "TA";
        } else if (users[i].role == 2) {
            role = "Student";
        } else {
            role = "Unknown";
        }

        const verified: boolean = users[i].verified;
        result.push(
            "<tr><th scope=\"row\">" + users[i].id + "</th>"
<<<<<<< HEAD
            + "<td><a style=\"display:block; height:100%; width:100%\" href=\"/users#" + users[i].id + "\">" + role + "</td>"
            + "<td><a style=\"display:block; height:100%; width:100%\" href=\"/users#" + users[i].id + "\">" + users[i].email + "</td>"
            + "<td><a style=\"display:block; height:100%; width:100%\" href=\"/users#" + users[i].id + "\">" + verified + "</td></tr></a>"
=======
            + "<td>" + role + "</td>"
            + "<td>" + users[i].email + "</td>"
            + "<td>" + verified + "</td></tr>"
>>>>>>> master
        );

    }

    const resultString: string = result.join("\n");
    usersHtml.innerHTML += resultString;
}

window.onload = async () => {
    await displayWhoami();
    await displayUsers();
    await displayCourses();
<<<<<<< HEAD

};
=======
};
>>>>>>> master
