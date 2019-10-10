import axios, {AxiosResponse} from 'axios';

import * as $ from "jquery";
import "popper.js"
import "bootstrap"

import {displayWhoami} from "./navbar";

//todo: change to selected user ofcourse
const hardcoded_userid: number = 73;

const pageTitleHtml: HTMLTitleElement = document.getElementById("page-title") as HTMLTitleElement;
const userInfoHtml: HTMLDivElement = document.getElementById("user-info") as HTMLDivElement;
const coursesNavHtml: HTMLDivElement = document.getElementById("courses-nav") as HTMLDivElement;

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

async function getCoursesPromise(): Promise<Course[]> {
    const response: AxiosResponse = await axios.get("/rest/courses/");
    return response.data;
}

async function getUserPromise(): Promise<User> {
    const path: string = "/rest/dbmusers/" + hardcoded_userid + "/";
    const response: AxiosResponse = await axios.get(path);
    return response.data;
}

async function displayUserDetails(): Promise<void> {
    const user: User = await getUserPromise();
    pageTitleHtml.innerHTML += "Admin - User " + user.id;

    let role: string;
    if (user.role == 0) {
        role = "Admin";
    } else if (user.role == 1) {
        role = "Teacher";
    } else if (user.role == 2) {
        role = "Student";
    } else {
        role = "Unknown";
    }

    // userInfoHtml.innerHTML +=
    //     "<>"
    //
    //
    //
    //
    //     "<ul><li>ID: " + user.id +
    //     "</li><li>Role: " + role + // Change role
    //     "</li><li>E-Mail: "  + user.email +
    //     "</li><li>Verified: " + user.verified +
    //     "</li>"
    //     ;

}

window.onload = async () => {
    await displayUserDetails();
    await displayWhoami();
}
