import { Controller } from "stimulus"

export default class extends Controller {
  static classes = [ "alert", "disabled" ]
  static targets = [ "errorText", "input", "submit" ]

  validateTextIsNumeric() {
    let value = event.target.value
    let isEmpty = value === ""
    let isNum = /^\d+$/.test(value)

    if (isEmpty || isNum) {
      this.errorTextTarget.innerText = ""
      this.submitTarget.disabled = false 
      this.submitTarget.classList.remove(this.disabledClass) 
    } else {
      this.errorTextTarget.innerText = "Numeric text only."
      this.submitTarget.disabled = true 
      this.submitTarget.classList.add(this.disabledClass) 
    }
  }
}
