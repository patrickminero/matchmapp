import { Controller } from "stimulus";

export default class extends Controller {
  static targets = [ 'mapView', 'barView' ]
  toggle() {
    this.mapViewTarget.classList.toggle('d-none')
    this.barViewTarget.classList.toggle('d-none')
  }
}
