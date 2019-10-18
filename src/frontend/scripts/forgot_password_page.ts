import {addAlert, addErrorAlert, addTempAlert, AlertType} from "./alert";
import axios, {AxiosError, AxiosResponse} from "axios";
import {validEmail} from "./register";

const passwordButton = document.getElementById("password-button") as HTMLButtonElement;
const registerEmailField: HTMLInputElement = document.getElementById("register-email-field") as HTMLInputElement;


async function tryRequestPassword() {
    if (validEmail()) {
        const tempAlert: ChildNode | null = addTempAlert();
        try {
            const response: AxiosResponse = await axios.post(`/request_reset_password/${registerEmailField.value}`);
            // const responseData = response.data;
            addAlert(`Please check your e-mail to reset your password`, AlertType.success, tempAlert)
        } catch (error) {
            const ae = error as AxiosError
            if (ae.response && ae.response.status === 404) {
                addAlert("This e-mail was not found", AlertType.danger,tempAlert)
            } else {
                addErrorAlert(error, tempAlert)
            }
        }
    }
}

window.onload = () => {
    passwordButton.addEventListener("click", tryRequestPassword);
}