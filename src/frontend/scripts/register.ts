import "../sass/main.sass"
import "popper.js"
import "bootstrap"
import "bootstrap-select"
import {addAlert, addErrorAlert, addTempAlert, AlertType} from "./alert";
import axios, {AxiosResponse} from "axios";

const registerButton: HTMLButtonElement = document.getElementById("register-button") as HTMLButtonElement;
const registerEmailField: HTMLInputElement = document.getElementById("register-email-field") as HTMLInputElement;
const registerPasswordField: HTMLInputElement = document.getElementById('register-password-field') as HTMLInputElement;
const registerPasswordConfirmField: HTMLInputElement = document.getElementById('register-password-confirm-field') as HTMLInputElement;
const content = document.getElementById('content') as HTMLFormElement;

interface Credentials {
    "email": string
    "password": string
}

export function setValid(input: HTMLInputElement): void {
    input.classList.remove("is-invalid");
    input.classList.add("is-valid");
    if (input.nextElementSibling) {
        const errorField: Element = input.nextElementSibling;
        errorField.textContent = "";
    } else {
        console.error("No sibling element for input. Contact the front-end devs with this error")
    }
}

export function setInvalid(input: HTMLInputElement, error: string): void {
    input.classList.remove("is-valid");
    input.classList.add("is-invalid");
    if (input.nextElementSibling) {
        const errorField: Element = input.nextElementSibling;
        errorField.textContent = error;
    } else {
        console.error("No sibling element for input. Contact the front-end devs with this error")
    }
}

export function passwordsEqual(passwordField: HTMLInputElement, passwordConfirmField: HTMLInputElement): boolean {
    if (passwordField.value === passwordConfirmField.value) {
        setValid(passwordConfirmField);
        return true;
    } else {
        setInvalid(passwordConfirmField, "Passwords do not match");
        return false;
    }
}

export function validEmail(field: HTMLInputElement): boolean {
    const emailPattern: RegExp = /[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?/;
    const utwentePattern: RegExp = /.*@([a-zA-Z0-9\/\+]*\.)?utwente\.nl$/;
    const email: string = field.value;
    if (emailPattern.test(email)) {
        if (utwentePattern.test(email)) {
            setValid(field);
            return true;
        } else {
            setInvalid(field, "Not a valid utwente.nl address");
        }
    } else {
        setInvalid(field, "Not a valid e-mail address");
    }
    return false;
}

export function validPassword(field: HTMLInputElement): boolean {
    const passwordPattern: RegExp = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{8,}$/;
    const password: string = field.value;
    if (passwordPattern.test(password)) {
        setValid(field);
        return true
    } else {
        setInvalid(field, "Password does not meet the requirements");
        return false;
    }
}

function checkFields(): boolean {
    const a = validEmail(registerEmailField); // Can't use a one-line function here due to lazy evaluation
    const b = validPassword(registerPasswordField);
    const c = passwordsEqual(registerPasswordField, registerPasswordConfirmField);
    return a && b && c
}

async function tryRegister(): Promise<void> {
    if (checkFields()) {
        const credentials: Credentials = {email: registerEmailField.value, password: registerPasswordField.value};
        const tempAlert: ChildNode | null = addTempAlert();
        registerEmailField.disabled = true;
        registerPasswordField.disabled = true;
        registerPasswordConfirmField.disabled = true;
        registerButton.disabled = true;
        try {
            const response: AxiosResponse<string> = await axios.post("/rest/dbmusers/", credentials) as AxiosResponse<string>;
            const responseData: string = response.data;
            addAlert(`Please check your inbox to confirm your e-mail`, AlertType.success, tempAlert)
        } catch (error) {
            addErrorAlert(error, tempAlert)
        } finally {
            registerEmailField.disabled = false;
            registerPasswordField.disabled = false;
            registerPasswordConfirmField.disabled = false;
            registerButton.disabled = false;
        }
    }
}


window.onload = () => {
    if (content) {
        content.addEventListener("submit", (event) => {
            event.preventDefault();
            tryRegister();
        });
    }
};
