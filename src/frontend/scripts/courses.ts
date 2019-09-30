import axios, {AxiosResponse} from 'axios';
// TODO uncomment these when needed, but never ship the product with the entirety of jquery and bootstrap in main.js
import * as $ from "jquery";
import "popper.js"
import "bootstrap"
import "bootstrap-select"
import "../sass/desktop.sass"

interface Course {
    courseid: number;
    fid: number;
    coursename: string;
    info: string
}

async function getCoursesPromise(): Promise<Course[]> { // TODO Check type here
    let response: AxiosResponse = await axios.get("/rest/courses/");
    return response.data;
    // let next = JSON.parse(data)
    // TODO actually convert API data to human readble format
}

async function displayCourses(): Promise<void> {
    const coursesDropdown: HTMLSelectElement = <HTMLSelectElement>document.getElementById("courses-dropdown"); // TODO actually make dropdown and fill
    let courses: Course[] = await getCoursesPromise();
    let result: string[] = [];
    for (let i = 0; i < courses.length; i++) {
        result.push("<option>" + courses[i].coursename + "</option>")
    }
    let resultString: string = result.join("\n");
    coursesDropdown.innerHTML += resultString;
}

window.onload = async () => {
    // $('select').selectpicker();
    await displayCourses();
    $('select').selectpicker(); // Style all selects
}

// TODO: make group gray
// TODO on course select: make group no longer gray