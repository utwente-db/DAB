import axios, {AxiosResponse} from 'axios';
import "popper.js"
import "bootstrap"
import {UserRole} from "./user";

const whoamiWelcomeHtml: HTMLDivElement = document.getElementById("whoamiWelcome") as HTMLDivElement;
const whoamiButtonHtml: HTMLDivElement = document.getElementById("whoamiButton") as HTMLDivElement;

export const navbarStudentView = document.getElementById("navbar-student-view") as HTMLLIElement;
export const navbarEditCourses = document.getElementById("navbar-edit-courses") as HTMLLIElement;
export const navbarEditStudents = document.getElementById("navbar-edit-students") as HTMLLIElement;
export const navbarChangePasswordLink = document.getElementById("navbar-change-password") as HTMLAnchorElement;
export const navbarLogoutLink = document.getElementById("navbar-logout") as HTMLAnchorElement;
export const navbarDumpAllDatabasesLink = document.getElementById("navbar-dump-all-databases") as HTMLAnchorElement;

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

export function changeNavbarState(enable: boolean) {


    [navbarStudentView, navbarEditCourses, navbarEditStudents].forEach((element: HTMLLIElement) => {
        if (enable) {
            (element.firstChild as HTMLAnchorElement)!.classList.remove("disabled")
        } else {
            (element.firstChild as HTMLAnchorElement)!.classList.add("disabled")

        }


    })

        [navbarChangePasswordLink, navbarLogoutLink, navbarDumpAllDatabasesLink].forEach((element: Element) => {
        if (enable) {
            element.classList.remove("disabled")
        } else {
            element.classList.add("disabled")

        }
    })

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
