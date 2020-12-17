import { Controller } from "stimulus"

export default class extends Controller {
  // instead of document.querySelector(....)
  // this.latitudeInputTarget
  static targets = ['latitudeInput', 'longitudeInput', 'location', 'form']

  connect() {
    try {
      
      if (window.navigator.geolocation) {
        window.navigator.geolocation
          .getCurrentPosition(
            // if user accepsts
            (position) => {
              const lat = position.coords.latitude
              const lng = position.coords.longitude
  
              this.latitudeInputTarget.value = lat
              this.longitudeInputTarget.value = lng
            },
            // if user rejects
            (err) => {
              // add code to show location input
              this.formTarget.classList.remove('hide-location')
              this.locationTarget.setAttribute('type', 'text')
            } 
          );
      }
    } catch (error) {
      console.log(error)
    }
  }
}