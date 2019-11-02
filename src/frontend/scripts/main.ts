import "../sass/main.sass"
import axios, {AxiosResponse, AxiosError} from "axios";
import Swal from "sweetalert2";
import "popper.js"
import "bootstrap"
import "bootstrap-select"

/**
 * Makes axios use url prefix found in template included in base.html (which all other pages extend)
 */
export const urlPrefix: string = document.getElementById("url-prefix")!.classList[0]!;

axios.defaults.baseURL=urlPrefix;
// tslint:disable-next-line:no-default-export
export default axios;
export { AxiosResponse };
export { AxiosError };