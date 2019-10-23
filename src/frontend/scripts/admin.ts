import axios, {AxiosResponse} from 'axios';
import {displayWhoami} from "./navbar";

import * as $ from "jquery";
import "popper.js";
import "bootstrap";
import {getUsersPromise, User} from "./user";
import {Course, getCoursesPromise} from "./courses";

const usersHtml: HTMLTableSectionElement = document.getElementById("users") as HTMLTableSectionElement;

const filterForm = document.getElementById("filter-form") as HTMLFormElement;



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
            + "<td><a style=\"display:block; height:100%; width:100%\" href=\"/userpage?id=" + users[i].id + "\">" + role + "</td>"
            + "<td><a style=\"display:block; height:100%; width:100%\" href=\"/userpage?id=" + users[i].id + "\">" + users[i].email + "</td>"
            + "<td><a style=\"display:block; height:100%; width:100%\" href=\"/userpage?id=" + users[i].id + "\">" + verified + "</td></tr>"
        );

    }

    const resultString: string = result.join("\n");
    usersHtml.innerHTML = resultString;
}

window.onload = async () => {
    await Promise.all([
        // filterForm.addEventListener("submit", (event) => {
        //     event.preventDefault();
        //     TODO actually figure out how to include filter here
        // }),
        displayWhoami(),
        displayUsers(),
        document.getElementById("navbar-edit-users")!.classList.add("active"),

    ]);
};
