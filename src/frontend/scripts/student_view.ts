import {getCoursesPromise, tryGetCredentials} from './courses'
import {displayWhoami} from "./navbar";
// TODO uncomment these when needed, but never ship the product with the entirety of jquery and bootstrap in main.js
import "popper.js"
import "bootstrap"

const coursesNavHtml: HTMLDivElement = document.getElementById("courses-nav") as HTMLDivElement;
const coursesContentHtml: HTMLDivElement = document.getElementById("courses-content") as HTMLDivElement;
const noCredsCoursename: HTMLHeadingElement = document.getElementById("no-credentials-coursename") as HTMLDivElement;
const noCredsInfo: HTMLDivElement = document.getElementById("no-credentials-courseinfo") as HTMLDivElement;
const credentialsButton: HTMLButtonElement = document.getElementById("credentials-button") as HTMLButtonElement;
const coursesDropdown: HTMLSelectElement = document.getElementById("courses-dropdown") as HTMLSelectElement;
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
    currentCourse = i;
    noCredsCoursename.innerText=courses[i].coursename;
    noCredsInfo.innerText=courses[i].info;
}

async function displayCourses(): Promise<void> {
    courses = await getCoursesPromise();
    const resultNav: string[] = [];

    for (let i = 0; i < courses.length; i++) {
        // TODO if credentials, push href to credentials-pane
        const templateString = `<a id="no-credentials-link-${i}" class="nav-link" data-toggle="pill" href="#no-credentials-pane">${courses[i].coursename}</a>`;

        const fragment: DocumentFragment = document.createRange().createContextualFragment(templateString);
        fragment.firstChild!.addEventListener("click",() => {populateNoCredentialsPane(i)});
        coursesNavHtml.appendChild(fragment);
    }
}

window.onload = async () => {
    // credentialsButton.addEventListener("click",() => {tryGetCredentials(currentCourse)})
    await displayCourses();
    await displayWhoami();

};
