import axios from 'axios'

 async function getCoursesPromise(): Promise<string> { // TODO Check type here
    return await axios.get("/courses/")
    // TODO actually convert API data to human readble format
}

async function displayCourses(): Promise<void> {
    let courses: string = await getCoursesPromise();
    let nice_div = document.getElementById("dropdown_div"); // TODO actually make dropdown and fill
    nice_div.innerHTML = courses;
}

window.onload = () => {
    displayCourses();
};

