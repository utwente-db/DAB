/**
 * change_password.ts:
 * Contains code for the change password page
 */

/**
 * Imports from other files
 */
import {addAlert, addErrorAlert, addTempAlert} from "./alert";
import axios, {AxiosError, urlPrefix} from "./main";
import {passwordsEqual, validPassword} from "./register";
import {changePageState, initNavbar} from "./navbar";
import {AlertType} from "./interfaces";

/**
 * Constant variable declarations (mostly html elements)
 */
const newPasswordButton = document.getElementById("new-password-button") as HTMLButtonElement,
    oldPasswordField = document.getElementById("old-password-field") as HTMLInputElement,
    newPasswordField = document.getElementById("new-password-field") as HTMLInputElement,
    confirmPasswordField = document.getElementById("confirm-password-field") as HTMLInputElement,
    content = document.getElementById('content') as HTMLFormElement;

/**
 * Checks the fields on the change password page.
 * Defines all the constants separately to avoid lazy evaluation of non-pure functions.
 * [[validPassword]] and [[passwordsEqual]] add feedback for the user to the form, so we must avoid lazy evaluation
 * @returns Whether all the fields are correct, or not
 */
function checkChangePasswordFields(): boolean {
    const a = validPassword(oldPasswordField); // Can't use a one-line function here due to lazy evaluation
    const b = validPassword(newPasswordField);
    const c = passwordsEqual(newPasswordField, confirmPasswordField);
    return a && b && c
}

/**
 * Disables or enables all the elements on the page
 * @param enable If true, enables elements. Else, disables elements.
 */
function changeChangePasswordState(enable: boolean): void {
    if (enable) {
        newPasswordField.disabled = false;
        oldPasswordField.disabled = false;
        confirmPasswordField.disabled = false;
        newPasswordButton.disabled = false;
        (document.getElementById("navbar-change-password") as HTMLAnchorElement)!.classList.add("disabled")
    } else {
        newPasswordField.disabled = true;
        oldPasswordField.disabled = true;
        confirmPasswordField.disabled = true;
        newPasswordButton.disabled = true;
    }
}

/**
 * Checks if all the inputs are correct, disables page elements, tries to reset the password, and adds alerts
 */
async function tryResetPassword(): Promise<void> {
    if (checkChangePasswordFields()) {
        changePageState(false, changeChangePasswordState);
        const tempAlert: ChildNode | null = addTempAlert();
        try {
            await axios.post(`/change_password/`, {'current': oldPasswordField.value, 'new': newPasswordField.value});
            if (tempAlert && document.body.contains(tempAlert)) {
                tempAlert.remove();
            }
            addTempAlert("Your password has been changed. You will soon be redirected to the homepage.", AlertType.success, false, 0);
            await new Promise(resolve => setTimeout(resolve, 3000));
            window.location.href = urlPrefix;
        } catch (error) {
            const ae = error as AxiosError;
            if (ae.response && ae.response.status === 403) {
                addAlert("The password entered in the current password field is incorrect", AlertType.danger, tempAlert)
            } else {
                addErrorAlert(error, tempAlert)
            }
        } finally {

            changePageState(true, changeChangePasswordState);
        }
    }
}

/**
 * Initiates navbar (see [[initNavbar]] ) and adds event listeners.
 * Disables the "change password" link in the navbar because we are already on that page.
 */
window.onload = () => {
    initNavbar(changeChangePasswordState);
    content.addEventListener("submit", (event) => {
        event.preventDefault();
        tryResetPassword();
    });
    (document.getElementById("navbar-change-password") as HTMLAnchorElement)!.classList.add("disabled")


};