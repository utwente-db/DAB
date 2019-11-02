import {addAlert, addErrorAlert, addTempAlert, AlertType} from "./alert";
import axios, {AxiosError, AxiosResponse} from "./main";
import {validEmail} from "./register";

const passwordButton = document.getElementById("password-button") as HTMLButtonElement;
const registerEmailField: HTMLInputElement = document.getElementById("register-email-field") as HTMLInputElement;
const content = document.getElementById('content') as HTMLFormElement;

/**
 * if [[validEmail]] returns true, tries to request a new password email for the user
 */
async function tryRequestPassword(): Promise<void> {
    if (validEmail(registerEmailField)) {
        passwordButton.disabled = true;
        registerEmailField.disabled = true;

        const tempAlert: ChildNode | null = addTempAlert();
        try {
            const response: AxiosResponse = await axios.post(`/request_reset_password/${registerEmailField.value}`);
            // const responseData = response.data;
            addAlert(`Please check your e-mail to reset your password`, AlertType.success, tempAlert)
        } catch (error) {
            const ae = error as AxiosError
            if (ae.response && ae.response.status === 404) {
                addAlert("This e-mail was not found", AlertType.danger, tempAlert)
            } else {
                addErrorAlert(error, tempAlert)
            }
        } finally {
            passwordButton.disabled = false;
            registerEmailField.disabled = false;
        }
    }
}

/**
 * Adds event listener to the form, makes it call [[tryRequestPassword]]
 */
window.onload = () => {
    content.addEventListener("submit", (event) => {
        event.preventDefault();
        tryRequestPassword();
    });
}