import {addAlert, addErrorAlert, addTempAlert, AlertType} from "./alert";
import axios, {AxiosError} from "axios";
import {passwordsEqual, validPassword} from "./register";
import {changeNavbarState} from "./navbar";

const newPasswordButton = document.getElementById("new-password-button") as HTMLButtonElement;

const oldPasswordField = document.getElementById("old-password-field") as HTMLInputElement;
const newPasswordField = document.getElementById("new-password-field") as HTMLInputElement;
const confirmPasswordField = document.getElementById("confirm-password-field") as HTMLInputElement;
const content = document.getElementById('content') as HTMLFormElement;

function checkFields(): boolean {
    const a = validPassword(oldPasswordField); // Can't use a one-line function here due to lazy evaluation
    const b = validPassword(newPasswordField);
    const c = passwordsEqual(newPasswordField, confirmPasswordField);
    return a && b && c
}

async function tryResetPassword(): Promise<void> {
    if (checkFields()) {
        newPasswordField.disabled = true;
        oldPasswordField.disabled = true;
        confirmPasswordField.disabled = true;
        newPasswordButton.disabled = true;
        changeNavbarState(false);
        const tempAlert: ChildNode | null = addTempAlert();
        try {
            await axios.post(`/change_password/`, {'current': oldPasswordField.value, 'new': newPasswordField.value});
            if (tempAlert && document.body.contains(tempAlert)) {
                tempAlert.remove();
            }
            addTempAlert("Your password has been changed. You will soon be redirected to the homepage.", AlertType.success, false, 0)
            await new Promise(resolve => setTimeout(resolve, 3000));
            window.location.href = "/";

        } catch (error) {
            const ae = error as AxiosError
            if (ae.response && ae.response.status === 403) {
                addAlert("The password entered in the current password field is incorrect", AlertType.danger, tempAlert)
            } else {
                addErrorAlert(error, tempAlert)
            }
        } finally {
            newPasswordField.disabled = false;
            oldPasswordField.disabled = false;
            confirmPasswordField.disabled = false;
            newPasswordButton.disabled = false;
            changeNavbarState(true);
            (document.getElementById("navbar-change-password") as HTMLAnchorElement)!.classList.add("disabled")

        }
    }
}

window.onload = () => {
    content.addEventListener("submit", (event) => {
        event.preventDefault();
        tryResetPassword();
    });
    (document.getElementById("navbar-change-password") as HTMLAnchorElement)!.classList.add("disabled")


};