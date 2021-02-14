import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "field" ]
  static values = { old: String }

  restore () {
    const input = this.fieldTarget
    if(this.oldValue) {
      input.value = this.oldValue
    }
  }

  clear () {
    const input = this.fieldTarget
    if (input.value) {
      this.oldValue = input.value
      input.value = ""
    }
  }
}
