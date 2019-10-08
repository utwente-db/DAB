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

interface Credentials {
    "email": string
    "password": string
}

function setValid(input: HTMLInputElement): void {
    input.classList.remove("is-invalid");
    input.classList.add("is-valid");
    if (input.nextElementSibling) {
        const errorField: Element = input.nextElementSibling;
        errorField.textContent = "";
    } else {
        console.error("No sibling element for input. Contact the front-end devs with this error")
    }
}

function setInvalid(input: HTMLInputElement, error: string): void {
    input.classList.remove("is-valid");
    input.classList.add("is-invalid");
    if (input.nextElementSibling) {
        const errorField: Element = input.nextElementSibling;
        errorField.textContent = error;
    } else {
        console.error("No sibling element for input. Contact the front-end devs with this error")
    }
}

function passwordsEqual(): boolean {
    if (registerPasswordField.value === registerPasswordConfirmField.value) {
        setValid(registerPasswordConfirmField);
        return true;
    } else {
        setInvalid(registerPasswordConfirmField, "Passwords do not match");
        return false;
    }
}

function validEmail(): boolean {
    const emailPattern: RegExp = /[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?/;
    const utwentePattern: RegExp = /.*@([a-zA-Z0-9\/\+]*\.)?utwente\.nl$/;
    const email: string = registerEmailField.value;
    if (emailPattern.test(email)) {
        if (utwentePattern.test(email)) {
            setValid(registerEmailField);
            return true;
        } else {
            setInvalid(registerEmailField, "Not a valid utwente.nl address");
        }
    } else {
        setInvalid(registerEmailField, "Not a valid e-mail address");
    }
    return false;
}

function validPassword(): boolean {
    const passwordPattern: RegExp = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{8,}$/;
    const password: string = registerPasswordField.value;
    if (passwordPattern.test(password)) {
        setValid(registerPasswordField);
        return true
    } else {
        setInvalid(registerPasswordField, "Password does not meet the requirements");
        return false;
    }
}

function checkFields(): boolean {
    const a = validEmail(); // Can't use a one-line function here due to lazy evaluation
    const b = validPassword();
    const c = passwordsEqual();
    return a && b && c
}

async function tryRegister(): Promise<void> {
    if (checkFields()) {
        const credentials: Credentials = {email: registerEmailField.value, password: registerPasswordField.value};
        const tempAlert: ChildNode | null = addTempAlert();
        try {
            // const response: AxiosResponse = await axios.post(DBMusers, credentials); // TODO fix type with interface
            // const database: responeType = await response.data;
            // addAlert(`that worked`, AlertType.success, tempAlert)
            // TODO redirect
        } catch (error) {
            addErrorAlert(error, tempAlert)
        }
    }


}


window.onload = () => {
    registerButton.addEventListener("click", tryRegister)
};
