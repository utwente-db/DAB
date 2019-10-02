import axios, {AxiosResponse} from 'axios';

// TODO uncomment these when needed, but never ship the product with the entirety of jquery and bootstrap in main.js
import * as $ from "jquery";
import "popper.js"
import "bootstrap"
import "bootstrap-select"
// import "../sass/desktop.sass"

const usersHtml: HTMLTableSectionElement = document.getElementById("users") as HTMLTableSectionElement;
const coursesNavHtml: HTMLDivElement = document.getElementById("courses-nav") as HTMLDivElement;
const coursesContentHtml: HTMLDivElement = document.getElementById("courses-content") as HTMLDivElement;

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

async function getCoursesPromise(): Promise<Course[]> {
    const response: AxiosResponse = await axios.get("/rest/courses/");
    return response.data;
}

async function getUsersPromise(): Promise<User[]> {
    const response: AxiosResponse = await axios.get("/rest/dbmusers/");
    return response.data;
}

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
            "<div class=\"tab-pane\" id=\"course" + i + "\">"
            + "<ul><li>" + courses[i].courseid + "</li>"
            + "<li>" + courses[i].fid + "</li>"
            + "<li>" + courses[i].coursename + "</li>"
            + "<li>" + courses[i].info + "</li></ul></div>"
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
            + "<td>" + role + "</td>"
            + "<td>" + users[i].email + "</td>"
            + "<td>" + verified + "</td></tr>"
        );

    }
    const resultString: string = result.join("\n");
    usersHtml.innerHTML += resultString;
}

window.onload = async () => {
    await displayUsers();
    await displayCourses();
};
