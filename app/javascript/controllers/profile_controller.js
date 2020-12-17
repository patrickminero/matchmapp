import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ["profile", "booking", "profileButton", "bookingButton"];

  connect() {
    
  } 

  showProfile() {
    
    this.bookingTarget.classList.add("d-none")
    this.profileTarget.classList.remove("d-none")
    this.profileButtonTarget.classList.add("active_tab")
    this.bookingButtonTarget.classList.remove("active_tab")
  }

  showBooking() {
    
    this.bookingTarget.classList.remove("d-none")
    this.profileTarget.classList.add("d-none")
    this.bookingButtonTarget.classList.add("active_tab")
    this.profileButtonTarget.classList.remove("active_tab")
  }
}