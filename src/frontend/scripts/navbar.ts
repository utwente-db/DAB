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
    role: number;
}

export async function getWhoamiPromise(): Promise<Whoami> {
    const response: AxiosResponse = await axios.get("/rest/whoami/");
    return response.data;
}

export async function displayWhoami(): Promise<void> {
    const whoami: Whoami = await getWhoamiPromise();
    let role: string;
    if (whoami.role === UserRole.admin) {
        role = "admin";
    } else if (whoami.role === UserRole.teacher) {
        role = "teacher";
    } else if (whoami.role === UserRole.student) {
        role = "student";
    } else {
        role = "unknown";
    }
    whoamiWelcomeHtml.innerHTML += whoami.email + " (" + role +")";
    // whoamiButtonHtml.innerHTML += "<button class=\"btn btn-secondary\" href=\"/settings\">Settings</button>";
}
