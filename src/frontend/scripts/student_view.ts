import {getCoursesPromise, tryGetCredentials, StudentDatabase} from './courses'
import {displayWhoami} from "./navbar";
import axios, {AxiosResponse, AxiosStatic} from 'axios';
// TODO uncomment these when needed, but never ship the product with the entirety of jquery and bootstrap in main.js
import "popper.js"
import "bootstrap"

const coursesNavHtml: HTMLDivElement = document.getElementById("courses-nav") as HTMLDivElement;
const coursesContentHtml: HTMLDivElement = document.getElementById("courses-content") as HTMLDivElement;
const noCredsCoursename: HTMLHeadingElement = document.getElementById("no-credentials-coursename") as HTMLDivElement;
const noCredsInfo: HTMLDivElement = document.getElementById("no-credentials-courseinfo") as HTMLDivElement;
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
    currentCourse = courses[i].courseid;
    noCredsCoursename.innerText = courses[i].coursename;
    noCredsInfo.innerText = courses[i].info;
}

async function displayCourses(): Promise<void> {
    courses = await getCoursesPromise();
    const ownDatabases = (await axios.get("/rest/studentdatabases/own/")).data;
    // tslint:disable-next-line:variable-name
    const ownCourses = ownDatabases.map((db: StudentDatabase) => db.course);
    console.log(ownCourses);
    const resultNav: string[] = [];

    for (let i = 0; i < courses.length; i++) {
        const haveCredentials = (courses[i].courseid in ownCourses);
        const credentialsClass = haveCredentials ? "have-credentials-nav" : "no-credentials-nav";
        // TODO if credentials, push href to credentials-pane
        const templateString = `<a class="nav-link ${credentialsClass}" data-toggle="pill" href="#no-credentials-pane">${courses[i].coursename}</a>`;
        const fragment: DocumentFragment = document.createRange().createContextualFragment(templateString);


        if (!haveCredentials) {
            fragment.firstChild!.addEventListener("click", () => {
                populateNoCredentialsPane(i)
            });
        }

        fragment.firstChild!.addEventListener("click", () => {
            alertDiv.innerHTML = "" // Remove all alerts when switching course
        });

        coursesNavHtml.appendChild(fragment);


    }
}

window.onload = async () => {
    credentialsButton.addEventListener("click", async () => {
        coursesNavHtml.childNodes.forEach((node: ChildNode) => (node as Element).classList.add("disabled"));
        await tryGetCredentials(currentCourse, Number(groupInput.value));
        coursesNavHtml.childNodes.forEach((node: ChildNode) => (node as Element).classList.remove("disabled"));
    });
    await displayCourses();
    await displayWhoami();
};
