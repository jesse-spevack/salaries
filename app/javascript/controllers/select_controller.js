import { Controller } from "stimulus"
import Rails from "@rails/ujs";

export default class extends Controller {
  static classes = [
    "backgroundHighlighted",
    "checked",
    "hide",
    "hidden",
    "highlighted",
    "notHighlighted",
    "show",
    "unchecked"
  ]

  static targets = [
    "form",
    "item",
    "list",
    "selectItem",
    "show"
  ]

  static values = { 
    attribute: String,
    item: String, 
    itemId: Number,
    path: String 
  }

  initialize() {
    this.setChecks();
    if(!this.itemValue) {
      this.showForm();
    }
  }

  choose(event) {
    let newValue = event.target.innerText
    let attribute = this.attributeValue
    let path = this.pathValue
    let params = { url: `/${path}`, type: "post" }

    if (this.itemIdValue) {
      params = { url: `/${path}/${this.itemIdValue}`, type: "patch" }
    }

    this.itemValue = newValue 
    for (let item of this.itemTargets) {
      item.innerText = newValue
    }

    this.hideForm()
    this.setChecks()

    Rails.ajax({
      type: params["type"],
      dataType: "json",
      url: params["url"],
      data: `${attribute}=${newValue}`,
    })
  }

  showForm() {
    this.showTarget.classList.add(this.hiddenClass)
    this.formTarget.classList.remove(this.hiddenClass)
  }

  hideForm() {
    this.showTarget.classList.remove(this.hiddenClass)
    this.formTarget.classList.add(this.hiddenClass)
  }

  showList() {
    this.listTarget.classList.replace(this.hideClass, this.showClass)
  }

  hideList() {
    this.listTarget.classList.replace(this.showClass, this.hideClass)
  }

  highlight(event) {
    event.target.classList.remove(this.notHighlightedClass)
    event.target.classList.add(this.highlightedClass, this.backgroundHighlightedClass)
    event.target.lastElementChild.classList.remove(this.uncheckedClass)
    event.target.lastElementChild.classList.add(this.checkedClass)
  }

  unhighlight(event) {
    event.target.classList.remove(this.highlightedClass, this.backgroundHighlightedClass)
    event.target.classList.add(this.notHighlightedClass)
    event.target.lastElementChild.classList.remove(this.checkedClass)
    event.target.lastElementChild.classList.add(this.uncheckedClass)
  }

  setChecks() {
    for (let selectItem of this.selectItemTargets) {
      if (selectItem.innerText.trim() != this.itemValue) {
        selectItem.lastElementChild.classList.add(this.hiddenClass)
      } else {
        selectItem.lastElementChild.classList.remove(this.hiddenClass)
      }
    }
  }
}
