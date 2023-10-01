import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="passenger"
export default class extends Controller {
  static targets = ['passengerItem']

  connect() {
    console.log(this.passengerItemTarget)
  }
}
