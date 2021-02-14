import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "field" ]
  static classes = [ "hidden" ]
  static values = { inputOld: String }

  show () {
    const input = this.fieldTarget.querySelector("input")
    input.disabled = false
    if(this.inputOldValue) {
      input.value = this.inputOldValue
    }
    input.classList.remove("opacity-25")
  }

  hide () {
    const input = this.fieldTarget.querySelector("input")
    input.disabled = true
    if (input.value) {
      this.inputOldValue = input.value
      input.value = ""
    }
    input.classList.add("opacity-25")
  }
}
