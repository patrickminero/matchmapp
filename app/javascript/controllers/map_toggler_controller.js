import { Controller } from "stimulus";

export default class extends Controller {
  static targets = [ 'mapView', 'barView', 'toggleButton' ]
  toggle() {
    // this.toggleButton.innerHTML = 'Map <i class="fas fa-map-marked-alt"></i>'
    this.mapViewTarget.classList.toggle('transition')
    this.barViewTarget.classList.toggle('transition')
    if(this.toggleButtonTarget.innerHTML === 'View map<i class="fas fa-map-marked-alt ml-2"></i>'){
      this.toggleButtonTarget.innerHTML = 'View list<i class="fas fa-stream ml-2"></i>'
    }
    else {
      this.toggleButtonTarget.innerHTML = 'View map<i class="fas fa-map-marked-alt ml-2"></i>'
    }
  }
}
