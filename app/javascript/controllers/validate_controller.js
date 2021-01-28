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
