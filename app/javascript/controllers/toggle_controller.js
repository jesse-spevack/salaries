import { Controller } from "stimulus"

export default class extends Controller {
  static classes = [ "on", "off", "translateOn", "translateOff", "invisible" ]
  static targets = [ "button", "switch", "checkbox" ]
  static values = {
    enabledEventName: String,
    disabledEventName: String,
    enabled: Boolean
  }

  initialize() {
    if(this.checkboxTarget.checked) {
      this.enabledValue = false
    } else {
      this.enabledValue = true
    }
  }

  update(event) {
    if(this.enabledValue) {
      this.enabledValue = false
    } else {
      this.enabledValue = true
    }
  }

  enabledValueChanged () {
    if (this.enabledValue) {
      window.dispatchEvent(new CustomEvent(this.enabledEventNameValue))
      this.checkboxTarget.checked = false
      this.buttonTarget.classList.replace(this.onClass, this.offClass)
      this.switchTarget.classList.replace(this.translateOnClass, this.translateOffClass)
      this.buttonTarget.focus()
    } else {
      window.dispatchEvent(new CustomEvent(this.disabledEventNameValue))
      this.checkboxTarget.checked = true
      this.buttonTarget.classList.replace(this.offClass, this.onClass)
      this.switchTarget.classList.replace(this.translateOffClass, this.translateOnClass)
      this.buttonTarget.blur()
    }
  }
}
