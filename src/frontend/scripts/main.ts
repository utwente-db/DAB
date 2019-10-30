import "../sass/main.sass"
import axios, {AxiosResponse, AxiosError} from "axios";
import Swal from "sweetalert2";
import "popper.js"
import "bootstrap"
import "bootstrap-select"

axios.defaults.baseURL=document.getElementById("url-prefix")!.classList[0]!;
// tslint:disable-next-line:no-default-export
export default axios;
export { AxiosResponse };
export { AxiosError };