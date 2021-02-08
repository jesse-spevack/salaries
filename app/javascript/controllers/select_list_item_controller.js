import { Controller } from "stimulus"
import Rails from "@rails/ujs";

export default class extends Controller {
  static classes = [
    "checked",
    "font",
    "hidden",
    "highlightedFont",
    "highlightedBackground",
    "text",
    "white",
  ]

  static targets = [
    "listItem",
    "listItemValue",
    "check",
  ]

  static values = { 
    isSelected: Boolean,
    listItem: String 
  }

  initialize() {
    if(this.isSelectedValue) {
      this.check();
    } else { 
      this.uncheck()
    }
  }

  deselect(event) {
    const eventValue = event.detail.value
    const listItemValue = this.listItemValue

    if(event.detail.value !== this.listItemValue) {
      this.isSelectedValue = false
      this.uncheck()
    }
  }

  select() {
    this.isSelectedValue = true
  }

  uncheck() {
    this.checkTarget.classList.add(this.hiddenClass)
  }

  check() {
    this.checkTarget.classList.remove(this.hiddenClass)
  }

  setCheck() {
    if(this.isSelectedValue) {
      this.checkTarget.classList.remove(this.hiddenClass)
    } else {
      this.checkTarget.classList.add(this.hiddenClass)
    }
  }

  isSelectedValueChanged() {
    if(this.isSelectedValue) {
      const detail = { value: this.listItemValueTarget.innerText }
      const listItemSelected = new CustomEvent("list-item-selected-event", { detail: detail })
      window.dispatchEvent(listItemSelected)
      this.check()
    } else {
      this.uncheck()
    }
  }

  highlight() {
    const listItem = this.listItemTarget
    const check = this.checkTarget

    listItem.classList.remove(this.textClass)
    listItem.classList.add(this.whiteClass, this.highlightedFontClass, this.highlightedBackgroundClass)

    check.classList.remove(this.checkedClass)
    check.classList.add(this.whiteClass)
  }

  removeHighlight(event) {
    const listItem = this.listItemTarget
    const check = this.checkTarget

    listItem.classList.add(this.textClass)
    listItem.classList.remove(this.whiteClass, this.highlightedFontClass, this.highlightedBackgroundClass)

    check.classList.add(this.checkedClass)
    check.classList.remove(this.whiteClass)
  }
}
