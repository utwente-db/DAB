import {addErrorAlert, addTempAlert, AlertType} from "./alert";
import axios, {urlPrefix} from "./main";
import {passwordsEqual, validPassword} from "./register";

const djangoTemplate = document.getElementById("django-template") as HTMLTemplateElement,
    newPasswordButton = document.getElementById("new-password-button") as HTMLButtonElement,
    newPasswordField = document.getElementById("new-password-field") as HTMLInputElement,
    confirmPasswordField = document.getElementById("confirm-password-field") as HTMLInputElement,
    content = document.getElementById('content') as HTMLFormElement, pk = Number(djangoTemplate.classList[0]),
    token = djangoTemplate.classList[1];


/**
 * Checks if password is valid and the same across fields
 * @returns whether all the fields meet the criteria
 */
function checkFields(): boolean {
    // Can't use a one-line function here due to lazy evaluation
    const b = validPassword(newPasswordField);
    const c = passwordsEqual(newPasswordField, confirmPasswordField);
    return b && c
}

/**
 * If fields are valid, sets a new password and redirects to login page
 */
async function tryResetPassword(): Promise<void> {
    if (checkFields()) {
        newPasswordField.disabled = true;
        confirmPasswordField.disabled = true;
        newPasswordButton.disabled = true;

        const tempAlert: ChildNode | null = addTempAlert();
        try {
            await axios.post(`/reset_password/${pk}/${token}`, {'password': newPasswordField.value});
            if (tempAlert && document.body.contains(tempAlert)) {
                tempAlert.remove();
            }
            addTempAlert("Your password has been changed. You will be redirected to the login page.", AlertType.success, false, 0);
            await new Promise(resolve => setTimeout(resolve, 3000));
            window.location.href = urlPrefix;
        } catch (error) {
            addErrorAlert(error, tempAlert)
        } finally {
            newPasswordField.disabled = false;
            confirmPasswordField.disabled = false;
            newPasswordButton.disabled = false;
        }
    }
}

/**
 * Adds event listener to form. Prevents default behavior and calls [[tryResetPassword]] instead
 */
window.onload = () => {
    content.addEventListener("submit", (event) => {
        event.preventDefault();
        tryResetPassword();
    });
};