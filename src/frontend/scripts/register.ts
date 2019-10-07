import "../sass/desktop.sass"
import "popper.js"
import "bootstrap"
import "bootstrap-select"

const registerButton: HTMLButtonElement = document.getElementById("register-button") as HTMLButtonElement;
const registerEmailField: HTMLInputElement = document.getElementById("register-email-field") as HTMLInputElement;
const registerPasswordField: HTMLInputElement = document.getElementById('register-password-field') as HTMLInputElement;
const registerPasswordConfirmField: HTMLInputElement = document.getElementById('register-password-confirm-field') as HTMLInputElement;

const registerJSON = {
    "email": "asdfasdf2",
    "password": "test205",
};

function setValid(input: HTMLInputElement): void {
    input.classList.remove("is-invalid");
    input.classList.add("is-valid")
        if (input.nextElementSibling) {
        const errorField: Element = input.nextElementSibling;
        errorField.textContent = "";
    } else {
        console.error("No sibling element for input. Contact the front-end devs with this error")
    }
}

function setInvalid(input: HTMLInputElement, error: string): void {
    input.classList.remove("is-valid");
    input.classList.add("is-invalid")
    if (input.nextElementSibling) {
        const errorField: Element = input.nextElementSibling;
        errorField.textContent = error;
    } else {
        console.error("No sibling element for input. Contact the front-end devs with this error")
    }
    // TODO add error
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
        setInvalid(registerEmailField, "Not a valid email address");
    }
    return false;
}

function validPassword(): boolean {
    const passwordRegex: RegExp = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{8,}$/
    // TODO add placeholder to password with hints
    setInvalid(registerPasswordField,"Invalid password")
    return false;
    // TODO Password check
    // todo error message
    // todo also back-en?
}

function checkFields(): boolean {
    const a =validEmail() // Can't use
    const b = validPassword()
    const c = passwordsEqual();
    return a && b && c
}

function register(): void {

}

function tryRegister(): void {
    if (checkFields()) {
        register()
    } else {
        // Show user an error
    }

}


window.onload = () => {
    registerButton.addEventListener("click", tryRegister)
};