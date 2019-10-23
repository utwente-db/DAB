import axios, {AxiosResponse} from 'axios';

import * as $ from "jquery";
import "popper.js"
import "bootstrap"
import {UserRole} from "./user";

const whoamiWelcomeHtml: HTMLDivElement = document.getElementById("whoamiWelcome") as HTMLDivElement;
const whoamiButtonHtml: HTMLDivElement = document.getElementById("whoamiButton") as HTMLDivElement;

export interface Whoami {
    id: number;
    email: string;
    role: UserRole;
}

export interface Who {
    id: number,
    role: UserRole
}

export async function getWhoamiPromise(): Promise<Whoami> {
    const response: AxiosResponse = await axios.get("/rest/whoami/");
    return response.data;
}

export async function getWhoPromise(): Promise<Who> {
    const response: AxiosResponse = await axios.get("/rest/who/");
    return response.data;
}

export async function displayWhoami(): Promise<void> {
    return;
    // const whoami: Whoami = await getWhoamiPromise();
    // let role: string;
    // if (whoami.role === UserRole.admin) {
    //     role = "admin";
    // } else if (whoami.role === UserRole.teacher) {
    //     role = "teacher";
    // } else if (whoami.role === UserRole.student) {
    //     role = "student";
    // } else {
    //     role = "unknown";
    // }
    // whoamiWelcomeHtml.innerHTML += whoami.email + " (" + role +")";
    // whoamiButtonHtml.innerHTML += "<button class=\"btn btn-secondary\" href=\"/settings\">Settings</button>";
}
