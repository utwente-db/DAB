import axios, {AxiosResponse} from 'axios';
import "popper.js"
import "bootstrap"

import {displayWhoami} from "./navbar";
import {Course, StudentDatabase} from "./courses";

//todo: change to selected user ofcourse
const hardcodedUserID = 73;

const pageTitleHtml: HTMLTitleElement = document.getElementById("page-title") as HTMLTitleElement;
const userInfoHtml: HTMLDivElement = document.getElementById("user-info") as HTMLDivElement;

const coursesNavHtml: HTMLDivElement = document.getElementById("courses-nav") as HTMLDivElement;
const courseDatabasesHtml: HTMLDivElement = document.getElementById("courses-db") as HTMLDivElement;

export interface User {
    id: number;
    role: number;
    email: string;
    password: string;
    verified: boolean;
    token: string;
}

export async function getUsersPromise(): Promise<User[]> {
    const response: AxiosResponse = await axios.get("/rest/dbmusers/");
    return response.data;
}

async function getDatabasesPromise(): Promise<StudentDatabase[]> {
    const response: AxiosResponse = await axios.get("/rest/studentdatabases/owner/" + hardcodedUserID + "/");
    return response.data;
}

async function getCourseByIDPromise(id: number): Promise<Course> {
    const response: AxiosResponse = await axios.get("/rest/courses/" + id + "/");
    return response.data;
}

async function getUserPromise(): Promise<User> {
    const path: string = "/rest/dbmusers/" + hardcodedUserID + "/";
    const response: AxiosResponse = await axios.get(path);
    return response.data;
}

async function displayCoursesAndDatabases(): Promise<void> {
    const databases: StudentDatabase[] = await getDatabasesPromise();

    const coursesAndDatabases: Map<number, string> = new Map<number, string>();

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

        const course: string | undefined = coursesAndDatabases.get(databases[i].course);
        if (course) {
            course.concat(html);
        }
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
        active = "";
        resultContent.push(
            "<div class=\"tab-pane" + active + "\" id=\"course" + course.courseid + "\">"
            + content
            + "</div>"
        );

        const resultNavString: string = resultNav.join("\n");
        const resultContentString: string = resultContent.join("\n");
        coursesNavHtml.innerHTML += resultNavString;
        courseDatabasesHtml.innerHTML += resultContentString;
    }
}

async function displayUserDetails(): Promise<void> {
    const user: User = await getUserPromise();
    pageTitleHtml.innerHTML += "Admin - User " + user.id;

    let role: string;
    if (user.role === 0) {
        role = "Admin";
    } else if (user.role === 1) {
        role = "Teacher";
    } else if (user.role === 2) {
        role = "Student";
    } else {
        role = "Unknown";
    }
}

window.onload = async () => {
    await Promise.all([
        displayUserDetails(),
        displayWhoami()
    ]);
};
