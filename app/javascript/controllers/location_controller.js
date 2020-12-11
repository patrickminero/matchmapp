import { Controller } from "stimulus"

export default class extends Controller {
  // instead of document.querySelector(....)
  // this.latitudeInputTarget
  static targets = ['latitudeInput', 'longitudeInput']

  connect() {
    if (window.navigator.geolocation) {
      window.navigator.geolocation
        .getCurrentPosition(
          // if user accepsts
          (position) => {
            const lat = position.coords.latitude
            const lng = position.coords.longitude

            this.latitudeInputTarget.value = lat
            this.longitudeInputTarget.value = lng
            // use fetch to to make a PATCH request
            // fetch('/users/:îd', {
            //   method: 'PATCH',
            //   body: {
            //     latitude: lat,
            //     longitude: lng
            //   }
            // })
          },
          // if user rejects
          (err) => {
            // add code to show location input
          } 
        );
     } 
  }
}