import { Controller } from "stimulus";

export default class extends Controller {
  static targets = [ 'mapView', 'barView', 'toggleButton' ]
  toggle() {
    // this.toggleButton.innerHTML = 'Map <i class="fas fa-map-marked-alt"></i>'
    this.mapViewTarget.classList.toggle('d-none')
    this.barViewTarget.classList.toggle('d-none')
  }
}
