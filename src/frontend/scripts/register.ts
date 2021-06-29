/**
 * register.ts:
 * Contains code for the register page
 */

/**
 * Imports from other files
 */
import "popper.js"
import "bootstrap"
import {addAlert, addErrorAlert, addTempAlert} from "./alert";
import axios, {AxiosResponse} from "./main";
import {AlertType, Credentials, User, UserRole} from "./interfaces";

/**
 * Constant variable declarations (HTML elements, mostly)
 */
const registerButton = document.getElementById("register-button") as HTMLButtonElement,
    registerEmailField = document.getElementById("register-email-field") as HTMLInputElement,
    registerPasswordField = document.getElementById('register-password-field') as HTMLInputElement,
    registerPasswordConfirmField = document.getElementById('register-password-confirm-field') as HTMLInputElement,
    content = document.getElementById('content') as HTMLFormElement;

/**
 * Sets a form input/textarea/select to be valid (gives it a green bootstrap outline) and removes any feedback under it
 * @param input The element to be changed
 */
export function setValid(input: HTMLInputElement | HTMLTextAreaElement | HTMLSelectElement): void {
    input.classList.remove("is-invalid");
    input.classList.add("is-valid");
    if (input.nextElementSibling) {
        const errorField: Element = input.nextElementSibling;
        errorField.textContent = "";
    } else {
        console.error("No sibling element for input. Contact the front-end devs with this error")
    }
}

/**
 * Sets a form input/textarea/select to be neutral (removes any green/red bootstrap outline) and removes any feedback under it
 * @param input The element to be changed
 */
export function setNeutral(input: HTMLInputElement | HTMLTextAreaElement | HTMLSelectElement): void {
    input.classList.remove("is-invalid");
    input.classList.remove("is-valid");
    if (input.nextElementSibling) {
        const errorField: Element = input.nextElementSibling;
        errorField.textContent = "";
    } else {
        console.error("No sibling element for input. Contact the front-end devs with this error")
    }
}

/**
 * Sets a form input/textarea/select to be invalid (gives it a red bootstrap outline) and places feedback under it
 * @param input The element to be changed
 * @error the feedback string to place under the element
 */
export function setInvalid(input: HTMLInputElement | HTMLTextAreaElement | HTMLSelectElement, error: string): void {
    input.classList.remove("is-valid");
    input.classList.add("is-invalid");
    if (input.nextElementSibling) {
        const errorField: Element = input.nextElementSibling;
        errorField.textContent = error;
    } else {
        console.error("No sibling element for input. Contact the front-end devs with this error")
    }
}

/**
 * Checks if two password fields have equal contents and provides feedback
 * @param passwordField Password field
 * @param passwordConfirmField Confirm password field (feedback will be placed under this one)
 * @returns whether the fields have equal contents
 */
export function passwordsEqual(passwordField: HTMLInputElement, passwordConfirmField: HTMLInputElement): boolean {
    if (passwordField.value === passwordConfirmField.value) {
        setValid(passwordConfirmField);
        return true;
    } else {
        setInvalid(passwordConfirmField, "Passwords do not match");
        return false;
    }
}

/**
 * Check if email field contains a utwente.nl email and gives user feedback
 * @param field Field to check
 * @returns whether the email meets the criteria
 */
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

/**
 * Check if password field contains a valid password and gives user feedback
 * @param field Field to check
 * @returns whether the password meets the criteria
 */
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

/**
 * Checks if all the fields are valid and gives feedback
 * @returns whether all fields are valid
 */
function checkFields(registerEmailField: HTMLInputElement, registerPasswordField: HTMLInputElement, registerPasswordConfirmField: HTMLInputElement): boolean {
    // Can't use a one-liner here due to lazy evaluation of non-pure functions
    const a = validEmail(registerEmailField);
    const b = validPassword(registerPasswordField);
    const c = passwordsEqual(registerPasswordField, registerPasswordConfirmField);
    return a && b && c
}

/**
 * Simple callback function needed for compatibility with navbar.ts [[ChangePageState]] while not having a navbar
 * @param enable Whether to enable elements or not
 * @param callback Callback function to execute
 */
function simpleCallback(enable: boolean, callback: Function): void {
    callback(enable);
}

/**
 * Enables/disables elements on the register page
 * @param enable Whether to enable or disable elements
 */
function changeRegisterPageState(enable: boolean): void {
    if (enable) {
        registerEmailField.disabled = false;
        registerPasswordField.disabled = false;
        registerPasswordConfirmField.disabled = false;
        registerButton.disabled = false;
    } else {
        registerEmailField.disabled = true;
        registerPasswordField.disabled = true;
        registerPasswordConfirmField.disabled = true;
        registerButton.disabled = true;
    }
}

/**
 * Tries and register by sending a POST to /rest/dbmusers if the fields are valid
 */
export async function tryRegister(registerEmailField: HTMLInputElement, registerPasswordField: HTMLInputElement,
                           registerPasswordConfirmField: HTMLInputElement, changePageStateCallback: Function,
                           disableCurrentPage: Function,
                           admin = false, role = UserRole.Student): Promise<User | null> {
    let user: User | null = null;
    if (checkFields(registerEmailField, registerPasswordField, registerPasswordConfirmField)) {

        const credentials: Credentials = {email: registerEmailField.value, password: registerPasswordField.value};
        if (admin) {
            credentials.admin = true;
            credentials.role = role;
        }

        const tempAlert: ChildNode | null = addTempAlert();
        changePageStateCallback(false, disableCurrentPage);
        try {
            const response = await axios.post("/rest/dbmusers/", credentials) as AxiosResponse<User>;
            user = response.data;
            if (admin) {
                addAlert(`User successfully added`, AlertType.success, tempAlert)
            } else {
                addAlert(`Please check your inbox to confirm your e-mail`, AlertType.success, tempAlert)
            }
        } catch (error) {
            addErrorAlert(error, tempAlert)
        } finally {
            changePageStateCallback(true, disableCurrentPage);
        }
    }
    return user;
}


/**
 * Adds event listener to the form (prevents default behavior to do API call instead)
 */
window.onload = () => {
    if (content) {
        content.addEventListener("submit", (event) => {
            event.preventDefault();
            tryRegister(registerEmailField, registerPasswordField, registerPasswordConfirmField, simpleCallback,changeRegisterPageState);
        });
    }
};
