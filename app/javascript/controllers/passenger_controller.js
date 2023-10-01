import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="passenger"
export default class extends Controller {
  static targets = ['passengerList', 'passengerItem']

  connect() {
    console.log(this.passengerListTarget)
    console.log(this.passengerItemTarget)
  }
}
