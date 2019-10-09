import axios, {AxiosResponse} from 'axios';
import {displayWhoami} from "./navbar";

// TODO uncomment these when needed, but never ship the product with the entirety of jquery and bootstrap in main.js
import * as $ from "jquery";
import "popper.js"
import "bootstrap"

const usersHtml: HTMLTableSectionElement = document.getElementById("users") as HTMLTableSectionElement;
const coursesNavHtml: HTMLDivElement = document.getElementById("courses-nav") as HTMLDivElement;
const coursesContentHtml: HTMLDivElement = document.getElementById("courses-content") as HTMLDivElement;

interface User {
    id: number;
    role: number;
    email: string;
    password: string;
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
        let active = "";
        if (i === 0) {
            active = " active";
        }
        resultNav.push(
            "<a class=\"nav-link" + active + "\" data-toggle=\"pill\" href=\"#course" + i + "\">" + courses[i].coursename + "</a>"
        );
        resultContent.push(
            "<div class=\"tab-pane" + active + "\" id=\"course" + i + "\">"
            + "<ul><li>ID: " + courses[i].courseid + "</li>"
            + "<li>FID: " + courses[i].fid + "</li>"
            + "<li>Coursename: " + courses[i].coursename + "</li>"
            + "<li>Info: " + courses[i].info + "</li></ul>"
            + "<button class=\"btn btn-secondary\" href=\"/courses#" + courses[i].courseid + "\">Edit Course</button></div>"
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
            "<tr><th scope=\"row\">" + users[i].id + "</th>"
            + "<td><a style=\"display:block; height:100%; width:100%\" href=\"/userpage\">" + role + "</td>"
            + "<td><a style=\"display:block; height:100%; width:100%\" href=\"/userpage\">" + users[i].email + "</td>"
            + "<td><a style=\"display:block; height:100%; width:100%\" href=\"/userpage\">" + verified + "</td></tr></a>"
            // "<tr><th scope=\"row\">" + users[i].id + "</th>"
            // + "<td><a style=\"display:block; height:100%; width:100%\" href=\"/users#" + users[i].id + "\">" + role + "</td>"
            // + "<td><a style=\"display:block; height:100%; width:100%\" href=\"/users#" + users[i].id + "\">" + users[i].email + "</td>"
            // + "<td><a style=\"display:block; height:100%; width:100%\" href=\"/users#" + users[i].id + "\">" + verified + "</td></tr></a>"
        );

    }

    const resultString: string = result.join("\n");
    usersHtml.innerHTML += resultString;
}

window.onload = async () => {
    // await displayUsers();
    // await displayCourses();
    await displayWhoami();
};
