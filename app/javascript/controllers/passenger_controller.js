import { Controller } from '@hotwired/stimulus';

export default class extends Controller {
  static targets = ['passengerList', 'passengerItem'];

  templateFields() {
    const passengerIndex =
      this.passengerListTarget.getElementsByTagName('li').length;

    const templateFields = ['name_0', 'email_2'].map((fieldName) => {
      let id = `booking_passengers_attributes_${passengerIndex}_${
        fieldName.split('_')[0]
      }`;
      let idPieces = id.split('_');
      let name = `${idPieces[0]}[${idPieces[1]}_${idPieces[2]}][${idPieces[3]}][${idPieces[4]}]`;
      let startIndex = Number(fieldName.split('_')[1]);
      let labelIndex = startIndex;
      let textFieldIndex = startIndex + 1;

      return {
        id: id,
        name: name,
        labelIndex: labelIndex,
        textFieldIndex: textFieldIndex,
      };
    });
    return templateFields;
  }

  setTemplateAttributes(template) {
    this.templateFields().forEach((field) => {
      template.firstElementChild.children[field.labelIndex].setAttribute(
        'for',
        field.id
      );
      template.firstElementChild.children[field.textFieldIndex].setAttribute(
        'id',
        field.id
      );
      template.firstElementChild.children[field.textFieldIndex].setAttribute(
        'name',
        field.name
      );
    });
  }

  addPassenger() {
    const template = this.passengerItemTarget.content.cloneNode(true);
    this.setTemplateAttributes(template);
    this.passengerListTarget.appendChild(template);
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
