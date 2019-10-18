import {addAlert, addErrorAlert, addTempAlert, AlertType} from "./alert";
import axios from "axios";
import {validEmail, validPassword} from "./register";

const djangoTemplate = document.getElementById("django-template") as HTMLTemplateElement;
const emailInput = document.getElementById("email-input") as HTMLInputElement;
const passwordInput = document.getElementById("password-input") as HTMLInputElement;
const loginButton = document.getElementById("login-button") as HTMLButtonElement;
const registerLink = document.getElementById("register-link") as HTMLAnchorElement;
const forgotPasswordLink = document.getElementById("forgot-password-link") as HTMLAnchorElement;
const loginForm = document.getElementById("login-form") as HTMLFormElement;

function disableInputs() {
    emailInput.disabled = true;
    passwordInput.disabled = true;
    loginButton.disabled = true;
    registerLink.toggleAttribute("href");
    forgotPasswordLink.toggleAttribute("href");
}

function enableInputs() {
    emailInput.disabled = false;
    passwordInput.disabled = false;
    loginButton.disabled = false;
    registerLink.toggleAttribute("href");
    forgotPasswordLink.toggleAttribute("href");
}

async function tryResendVerificationEmail(tempAlert: ChildNode | null) {

    disableInputs();
    const userEmail: string = djangoTemplate.classList[1];
    if (tempAlert && document.body.contains(tempAlert)) {
        tempAlert.remove();
    }
    const newTempAlert: ChildNode | null = addTempAlert();
    try {
        await axios.post(`/resend_verification/`, {'email': userEmail});
        addAlert(`Please check your inbox to confirm your e-mail`, AlertType.success, newTempAlert)
    } catch (error) {
        addErrorAlert(error, newTempAlert)
    } finally {
        enableInputs()
    }

}


function checkFields() {
    const a = validEmail(emailInput);
    const b = validPassword(passwordInput);
    return a && b;
}

function tryLogin() {
    if (checkFields()) {
        loginForm.submit();
        // disableInputs();
        // const userEmail: string = djangoTemplate.classList[1];
        //
        // const tempAlert: ChildNode | null = addTempAlert();
        // try {
        //     await axios.post(`/resend_verification/`, {'email': userEmail});
        //     addAlert(`Please check your inbox to confirm your e-mail`, AlertType.success, newTempAlert)
        // } catch (error) {
        //     addErrorAlert(error, newTempAlert)
        // } finally {
        //     enableInputs()
        // }

    }
}

window.onload = () => {

    if (djangoTemplate.classList.contains("resend-verification")) {
        const tempAlert: ChildNode | null = addTempAlert("Please verify your email first. <a href='javascript: void(0)' id='verification-link'>Click here to resend verification email.</a>", AlertType.danger, false, 0)
        const verificationLink = document.getElementById("verification-link") as HTMLAnchorElement;
        verificationLink.addEventListener("click", (event) => {
            event.preventDefault();

            tryResendVerificationEmail(tempAlert);
        })
    }

    if (loginForm) {
        loginForm.addEventListener("submit", (event) => {
            event.preventDefault();
            tryLogin();
        });
    }
}