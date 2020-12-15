import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ 'many', 'few', 'none', 'manyButton' ]

  status() {
    this.manyTarget.classList.toggle('text-muted')
  }
}