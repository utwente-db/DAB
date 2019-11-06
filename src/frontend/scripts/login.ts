/**
 * login.ts:
 * Contains code for the login page
 */

/**
 * Imports from other files
 */
import {addAlert, addErrorAlert, addTempAlert} from "./alert";
import axios from "./main";
import {validEmail, validPassword} from "./register";
import "bootstrap-cookie-alert/cookiealert.js"
import {AlertType} from "./interfaces";

/**
 * Constant variable declarations (mostly HTML elements)
 */
const djangoTemplate = document.getElementById("django-template") as HTMLTemplateElement,
    emailInput = document.getElementById("email-input") as HTMLInputElement,
    passwordInput = document.getElementById("password-input") as HTMLInputElement,
    loginButton = document.getElementById("login-button") as HTMLButtonElement,
    registerLink = document.getElementById("register-link") as HTMLAnchorElement,
    forgotPasswordLink = document.getElementById("forgot-password-link") as HTMLAnchorElement,
    loginForm = document.getElementById("login-form") as HTMLFormElement;

/**
 * Disables all inputs on login page
 */
function disableInputs(): void {
    emailInput.disabled = true;
    passwordInput.disabled = true;
    loginButton.disabled = true;
    registerLink.toggleAttribute("href");
    forgotPasswordLink.toggleAttribute("href");
}

/**
 * Enables all inputs on login page
 */
function enableInputs(): void {
    emailInput.disabled = false;
    passwordInput.disabled = false;
    loginButton.disabled = false;
    registerLink.toggleAttribute("href");
    forgotPasswordLink.toggleAttribute("href");
}

/**
 * Called if you click the "resend my verification email" link, resends the verification email
 * @param tempAlert Temporary alert to be removed
 */
async function tryResendVerificationEmail(tempAlert: ChildNode | null): Promise<void> {

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

/**
 * Checks email and password field for correctness, and gives user feedback
 * @returns whether the inputs were both correct
 */
function checkFields(): boolean {
    const a = validEmail(emailInput);
    const b = validPassword(passwordInput);
    return a && b;
}

/**
 * Tries to login if [[checkFields]] returns true
 */
function tryLogin(): void {
    if (checkFields()) {
        loginForm.submit();
    }
}

/**
 * Checks whether there is a template with data passed on from django variables, and gives the user appropriate feedback
 * For example, if the template contains the class resend-verification, it will display a resend verification link to the user
 */
window.onload = () => {
    if (djangoTemplate.classList.contains("resend-verification")) {
        const tempAlert: ChildNode | null = addTempAlert("Please verify your email first. <a href='javascript: void(0)' id='verification-link'>Click here to resend verification email.</a>", AlertType.danger, false, 0);
        const verificationLink = document.getElementById("verification-link") as HTMLAnchorElement;
        verificationLink.addEventListener("click", (event) => {
            event.preventDefault();

            tryResendVerificationEmail(tempAlert);
        })
    } else if (djangoTemplate.classList.contains("incorrect-message")) {
        addAlert("Wrong email or password", AlertType.danger)
    } else if (djangoTemplate.classList.contains("could-not-parse-form")) {
        addAlert("Could not parse form", AlertType.danger)
    } else if (djangoTemplate.classList.contains("you-have-been-logged-out")) {
        addAlert("You have been logged out", AlertType.primary)
    } else if (djangoTemplate.classList.contains("account-verified")) {
        addAlert("Your account has been verified and you can now log in", AlertType.success)
    } else if (djangoTemplate.classList.contains("new-password")) {
        addAlert("You may now log in with your new password", AlertType.success)
    }

    if (loginForm) {
        loginForm.addEventListener("submit", (event) => {
            event.preventDefault();
            tryLogin();
        });
    }
};
