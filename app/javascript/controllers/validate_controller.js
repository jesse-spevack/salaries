import { Controller } from "stimulus"

export default class extends Controller {
  static classes = [ "alert" ]
  static targets = [ "errorText", "input" ]

  validateTextIsNumeric() {
    let value = event.target.value
    let isEmpty = value === ""
    let isNum = /^\d+$/.test(value)

    if (isEmpty || isNum) {
      this.errorTextTarget.innerText = ""
    } else {
      this.errorTextTarget.innerText = "Numeric text only."
    }
  }
}
