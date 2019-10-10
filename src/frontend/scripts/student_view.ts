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

function logShit() {
    console.log('yeet')
}

async function displayCourses(): Promise<void> {
    courses = await getCoursesPromise();
    const resultNav: string[] = [];

    for (let i = 0; i < courses.length; i++) {
        // TODO if credentials, push href to credentials-pane
        const templateString = `<a id="no-credentials-link-${i}" class="nav-link" data-toggle="pill" href="#no-credentials-pane">${courses[i].coursename}</a>`;
        const tempTemplate = document.createElement('template');
        // tempTemplate.innerHTML = templateString;

        const element: DocumentFragment = document.createRange().createContextualFragment(templateString);
        const node: Node = coursesNavHtml.appendChild(element);
        node.addEventListener("click",() => {console.log("yeet")})




        // if (courseOwned) {
        //     resultContent.push(
        //         `
        //             `
        //     );
        // }


    }
}

window.onload = async () => {

    await displayCourses();
    await displayWhoami();

};
