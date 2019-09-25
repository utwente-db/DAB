import axios from 'axios'

async function getCoursesPromise(): Promise<string> { // TODO Check type here
    let response = await axios.get("/courses/")
    let data: string = response.data;
    return data
    // let next = JSON.parse(data)
    // TODO actually convert API data to human readble format
}

const nice_div: HTMLElement = document.getElementById("dropdown_div"); // TODO actually make dropdown and fill
async function displayCourses(): Promise<void> {
    let courses: string = await getCoursesPromise();
    nice_div.innerHTML = courses;
}

nice_div.addEventListener("load", displayCourses);


