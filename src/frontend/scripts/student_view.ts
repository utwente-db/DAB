import {getCoursesPromise, StudentDatabase, tryGetCredentials} from './courses'
import {displayWhoami} from "./navbar";
import axios from 'axios';
import "popper.js"
import "bootstrap"

const coursesNavHtml: HTMLDivElement = document.getElementById("courses-nav") as HTMLDivElement;
const coursesContentHtml: HTMLDivElement = document.getElementById("courses-content") as HTMLDivElement;
const noCredsCoursename: HTMLHeadingElement = document.getElementById("no-credentials-coursename") as HTMLDivElement;
const noCredsInfo: HTMLDivElement = document.getElementById("no-credentials-courseinfo") as HTMLDivElement;
const haveCredsCoursename: HTMLHeadingElement = document.getElementById("have-credentials-coursename") as HTMLDivElement;
const haveCredsInfo: HTMLDivElement = document.getElementById("have-credentials-courseinfo") as HTMLDivElement;
const credentialsDiv: HTMLDivElement = document.getElementById("credentials-div") as HTMLDivElement;
const haveCredsPane: HTMLHeadingElement = document.getElementById("have-credentials-pane") as HTMLDivElement;
const noCredsPane: HTMLHeadingElement = document.getElementById("no-credentials-pane") as HTMLDivElement;


const credentialsButton: HTMLButtonElement = document.getElementById("credentials-button") as HTMLButtonElement;
const groupInput: HTMLInputElement = document.getElementById("group-input") as HTMLInputElement;
const alertDiv: HTMLDivElement = document.getElementById("alert-div") as HTMLDivElement;

let courses: Course[];
let currentCourse = 0;

interface Course {
    courseid: number;
    fid: number;
    coursename: string;
    info: string;
}

function populateNoCredentialsPane(i: number) {
    noCredsCoursename.innerText = courses[i].coursename;
    noCredsInfo.innerText = courses[i].info;
}

async function populateHaveCredentialsPane(i: number) {
    let credentials = "";
    haveCredsCoursename.innerText = courses[i].coursename;
    haveCredsInfo.innerText = courses[i].info;
    const ownDatabases: StudentDatabase[] = (await axios.get("/rest/studentdatabases/own/")).data as StudentDatabase[];
    ownDatabases.forEach((db: StudentDatabase) => {
        if (db.course === courses[i].courseid) {
            credentials += `username: ${db.username}<br>
                            password: ${db.password}<br><br>`
        }
    });
    credentialsDiv.innerHTML=credentials;
    // TODO populate with credentials
}

function createNavLink(haveCredentials: boolean, i: number, active = false): DocumentFragment {
    const credentialsClass = haveCredentials ? "have-credentials-nav" : "no-credentials-nav";
    const hrefString = haveCredentials ? "have-credentials-pane" : "no-credentials-pane";
    const activeString = active ? "active" : "";
    const templateString = `<a id="${i}" class="nav-link ${credentialsClass} ${activeString}" data-toggle="pill" href="#${hrefString}">${courses[i].coursename}</a>`;
    const fragment: DocumentFragment = document.createRange().createContextualFragment(templateString);


    if (!haveCredentials) {
        fragment.firstChild!.addEventListener("click", () => {
            populateNoCredentialsPane(i);
        });
    } else {
        fragment.firstChild!.addEventListener("click", () => {
            populateHaveCredentialsPane(i);
        });
    }

    fragment.firstChild!.addEventListener("click", () => {
        currentCourse = courses[i].courseid;
        alertDiv.innerHTML = "" // Remove all alerts when switching course
    });
    return fragment;
}

async function displayCourses(): Promise<void> {
    courses = await getCoursesPromise();
    const ownDatabases = (await axios.get("/rest/studentdatabases/own/")).data;
    // tslint:disable-next-line:variable-name
    const ownCourses = ownDatabases.map((db: StudentDatabase) => db.course);
    console.log(ownCourses);
    const resultNav: string[] = [];

    for (let i = 0; i < courses.length; i++) {
        const haveCredentials = (ownCourses.includes(courses[i].courseid)); // TODO change this later when max databases > 1
        const fragment = createNavLink(haveCredentials, i);

        coursesNavHtml.appendChild(fragment);


    }
}

function changeViewToHaveCredentials() {
    const activeLink: HTMLLinkElement = document.getElementsByClassName("nav-link no-credentials-nav active")[0] as HTMLLinkElement;
    const i = Number(activeLink.id);
    const fragment = createNavLink(true, i, true);
    activeLink.classList.remove("active");
    activeLink.insertAdjacentElement("afterend", fragment.firstElementChild!);
    activeLink.remove();
    noCredsPane.classList.remove("active");
    haveCredsPane.classList.add("active");
    populateHaveCredentialsPane(i);
}

async function prepareToGetCredentials() {
    coursesNavHtml.childNodes.forEach((node: ChildNode) => (node as Element).classList.add("disabled"));
    credentialsButton.classList.add("disabled");
    const success = await tryGetCredentials(currentCourse, Number(groupInput.value));
    coursesNavHtml.childNodes.forEach((node: ChildNode) => (node as Element).classList.remove("disabled"));
    credentialsButton.classList.remove("disabled");
    if (success) {
        changeViewToHaveCredentials()
    }
}

window.onload = async () => {
    credentialsButton.addEventListener("click", prepareToGetCredentials);
    await displayCourses();
    await displayWhoami();
};
