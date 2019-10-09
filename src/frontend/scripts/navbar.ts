import axios, {AxiosResponse} from 'axios';

import * as $ from "jquery";
import "popper.js"
import "bootstrap"

const whoamiWelcomeHtml: HTMLDivElement = document.getElementById("whoamiWelcome") as HTMLDivElement;
const whoamiButtonHtml: HTMLDivElement = document.getElementById("whoamiButton") as HTMLDivElement;

interface Whoami {
    id: number;
    email: string;
    role: number;
}

async function getWhoamiPromise(): Promise<Whoami> {
    const response: AxiosResponse = await axios.get("/rest/whoami/");
    return response.data;
}

export async function displayWhoami(): Promise<void> {
    const whoami: Whoami = await getWhoamiPromise();
    let role: string;
    if (whoami.role == 0) {
        role = "an Admin";
    } else if (whoami.role == 1) {
        role = "a Teacher";
    } else if (whoami.role == 2) {
        role = "a Student";
    } else {
        role = "Unknown";
    }
    whoamiWelcomeHtml.innerHTML += "Welcome " + whoami.email + "\t You are " + role;
    whoamiButtonHtml.innerHTML += "<a class=\"btn btn-secondary\" href=\"/settings\" role=\"button\">Settings</a>";
}
