import { Controller } from '@hotwired/stimulus';

// Connects to data-controller="passenger"
export default class extends Controller {
  static targets = ['passengerList', 'passengerItem'];

  connect() {
  }

  addPassenger() {
    const clone = this.passengerItemTarget.content.cloneNode(true);
    const passengerIndex =
      this.passengerListTarget.getElementsByTagName('li').length;

    let id = `booking_passengers_attributes_${passengerIndex}_name`;
    let idPieces = id.split('_');
    let name = `${idPieces[0]}[${idPieces[1]}_${idPieces[2]}][${idPieces[3]}][${idPieces[4]}]`;

    clone.firstElementChild.children[0].setAttribute('for', id);
    clone.firstElementChild.children[1].setAttribute('id', id);
    clone.firstElementChild.children[1].setAttribute('name', name);

    id = `booking_passengers_attributes_${passengerIndex}_email`;
    idPieces = id.split('_');
    name = `${idPieces[0]}[${idPieces[1]}_${idPieces[2]}][${idPieces[3]}][${idPieces[4]}]`;

    clone.firstElementChild.children[2].setAttribute('for', id);
    clone.firstElementChild.children[3].setAttribute('id', id);
    clone.firstElementChild.children[3].setAttribute('name', name);

    this.passengerListTarget.appendChild(clone);
  }

  removePassenger(event) {

    const number_of_passengers =
      this.passengerListTarget.getElementsByTagName('li').length;
    if (number_of_passengers === 1) {
      return;
    }

    const element = event.target;
    element.parentElement.remove();
  }
}
