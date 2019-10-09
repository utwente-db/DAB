import axios, {AxiosResponse} from 'axios';
import {getCoursesPromise} from './courses'
import {displayWhoami} from "./navbar";
// TODO uncomment these when needed, but never ship the product with the entirety of jquery and bootstrap in main.js
import "popper.js"
import "bootstrap"

const coursesNavHtml: HTMLDivElement = document.getElementById("courses-nav") as HTMLDivElement;
const coursesContentHtml: HTMLDivElement = document.getElementById("courses-content") as HTMLDivElement;
let courses: Course[];

interface Course {
    courseid: number;
    fid: number;
    coursename: string;
    info: string;
}

async function displayCourses(): Promise<void> {
    courses = await getCoursesPromise();
    const resultNav: string[] = [];
    const resultContent: string[] = [];

    for (let i = 0; i < courses.length; i++) {
        const active = "";

        resultNav.push(
            "<a class=\"nav-link" + active + "\" data-toggle=\"pill\" href=\"#course" + i + "\">" + courses[i].coursename + "</a>"
        );
        resultContent.push(
            "<div class=\"tab-pane" + active + "\" id=\"course" + i + "\">"
            + "<ul><li>ID: " + courses[i].courseid + "</li>"
            + "<li>FID: " + courses[i].fid + "</li>"
            + "<li>Coursename: " + courses[i].coursename + "</li>"
            + "<li>Info: " + courses[i].info + "</li></ul>"
            + "<button class=\"btn btn-secondary\" href=\"/courses#" + courses[i].courseid + "\">Edit Course</button></div>"
        );
    }
    const resultNavString: string = resultNav.join("\n");
    const resultContentString: string = resultContent.join("\n");
    coursesNavHtml.innerHTML += resultNavString;
    coursesContentHtml.innerHTML += resultContentString;
}

window.onload = async () => {
    await displayCourses();
    await displayWhoami();
};
