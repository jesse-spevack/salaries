import { Controller } from "stimulus"

export default class extends Controller {
  static classes = [ "alert", "disabled" ]
  static targets = [ "errorText", "input", "submit", "searchListErrorText" ]

  validateTextIsNumeric() {
    let value = event.target.value
    let isEmpty = value === ""
    let isNum = /^\d+$/.test(value)

    if (isEmpty || isNum) {
      this.errorTextTarget.innerText = ""
      this.enableForm()
    } else {
      this.errorTextTarget.innerText = "Numeric text only."
      this.disableForm()
    }
  }

  validSearchList() {
    this.searchListErrorTextTarget.innerText = ""
    this.enableForm()
  }

  invalidSearchList() {
    this.searchListErrorTextTarget.innerText = "Select a location from dropdown list"
    this.disableForm()
  }

  enableForm() {
    this.submitTarget.disabled = false 
    this.submitTarget.classList.remove(this.disabledClass) 
  }

  disableForm() {
    this.submitTarget.disabled = true 
    this.submitTarget.classList.add(this.disabledClass) 
  }
}
