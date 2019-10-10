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
        const courseOwned = true;
        resultNav.push(
            `<a class="nav-link" data-toggle="pill" href="#course${i}">${courses[i].coursename}</a>`
        );

        if (courseOwned) {
            resultContent.push(
                `<div class="tab-pane" id="course${i}">
                  <ul><li>Info: ${courses[i].info}</li></ul>
                  <button class="btn btn-secondary course-not-owned-button" 
                  href="/courses#${courses[i].courseid}">Edit Course</button></div>`
            );
        }


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
