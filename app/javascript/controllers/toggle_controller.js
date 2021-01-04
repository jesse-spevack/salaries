// Visit The Stimulus Handbook for more details 
// https://stimulusjs.org/handbook/introduction
// 
// This example controller works with specially annotated HTML like:
//
// <div data-controller="hello">
//   <h1 data-target="hello.output"></h1>
// </div>

import { Controller } from "stimulus"

export default class extends Controller {
  static classes = [ "on", "off", "translateOn", "translateOff", "invisible" ]
  static targets = [ "button", "switch", "checkbox", "endDate" ]

  initialize() {
    if(!this.checkboxTarget.checked) {
      this.buttonTarget.classList.replace(this.onClass, this.offClass)
      this.switchTarget.classList.replace(this.translateOnClass, this.translateOffClass)
      this.endDateTarget.classList.remove(this.invisibleClass)
    } else {
      this.buttonTarget.classList.replace(this.offClass, this.onClass)
      this.switchTarget.classList.replace(this.translateOffClass, this.translateOnClass)
      this.endDateTarget.classList.add(this.invisibleClass)
    }
  }

  update(event) {
    if(this.buttonTarget.classList.contains(this.onClass)) {
      this.buttonTarget.classList.replace(this.onClass, this.offClass)
      this.switchTarget.classList.replace(this.translateOnClass, this.translateOffClass)
      this.checkboxTarget.checked = false
      this.buttonTarget.focus();
      this.endDateTarget.classList.remove(this.invisibleClass)
    } else {
      this.buttonTarget.classList.replace(this.offClass, this.onClass)
      this.switchTarget.classList.replace(this.translateOffClass, this.translateOnClass)
      this.checkboxTarget.checked = true
      this.buttonTarget.blur();
      this.endDateTarget.classList.add(this.invisibleClass)
    }

  }
}
