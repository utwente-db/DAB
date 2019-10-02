import axios, {AxiosResponse} from 'axios';

// TODO uncomment these when needed, but never ship the product with the entirety of jquery and bootstrap in main.js
// import * as $ from "jquery";
// import "popper.js"
// import "bootstrap"

const coursesDropdown: HTMLSelectElement = document.getElementById("courses-dropdown") as HTMLSelectElement;

interface User {
    id: number;
    role: number;
    email: string;
    password: string;
    maxdatabases: number;
    verified: boolean;
    token: string;
}

async function getUsersPromise(): Promise<User[]> {
    const response: AxiosResponse = await axios.get("/rest/dbmusers/");
    return response.data;
}

async function displayUsers(): Promise<void> {
    const users: User[] = await getUsersPromise();
    const result: string[] = [];
    for (let i = 0; i < users.length; i++) {
        result.push("<option value='" + users[i].id + "'>" + users[i].email + "</option>")
    }
    const resultString: string = result.join("\n");
    coursesDropdown.innerHTML += resultString;
}

window.onload = async () => {
    await displayUsers();
};