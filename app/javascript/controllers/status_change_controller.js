import { Controller } from "stimulus";

export default class extends Controller {
    static targets = [ 'form' ];

    newstatus(event) {
        this.formTarget.submit();
    }
}