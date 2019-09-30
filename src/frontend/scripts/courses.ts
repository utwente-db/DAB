import axios, {AxiosResponse} from 'axios';

// TODO uncomment these when needed, but never ship the product with the entirety of jquery and bootstrap in main.js
// import "jquery"
// import "popper.js"
// import "bootstrap";

import "../sass/desktop.sass"

async function getCoursesPromise(): Promise<string> { // TODO Check type here
    let response: AxiosResponse = await axios.get("/courses/");
    let data: string = response.data;
    return data;
    // let next = JSON.parse(data)
    // TODO actually convert API data to human readble format
}

const nice_div: HTMLElement = document.getElementById("nice-div"); // TODO actually make dropdown and fill
async function displayCourses(): Promise<void> {
    let courses: string = await getCoursesPromise();
    nice_div.innerHTML = courses;
}

window.onload = displayCourses;