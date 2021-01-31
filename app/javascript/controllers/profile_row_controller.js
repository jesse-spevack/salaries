import { Controller } from "stimulus"
import Rails from "@rails/ujs";

export default class extends Controller {
  static classes = [
    "hidden"
  ]

  static targets = [
    "form",
    "item",
    "show"
  ]

  static values = { 
    attribute: String,
    item: String, 
    itemId: Number,
    path: String 
  }

  post(event) {
    let newValue = event.detail.selectValue 
    let attribute = this.attributeValue
    let path = this.pathValue
    let params = { url: `/${path}`, type: "post" }

    if (this.itemIdValue) {
      params = { url: `/${path}/${this.itemIdValue}`, type: "patch" }
    }

    this.itemTarget.innerText = newValue 
    this.toggleForm()

    Rails.ajax({
      type: params["type"],
      dataType: "json",
      url: params["url"],
      data: `${attribute}=${newValue}`,
    })
  }

  toggleForm() {
    this.showTarget.classList.toggle(this.hiddenClass)
    this.formTarget.classList.toggle(this.hiddenClass)
  }
}
