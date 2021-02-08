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

  connect () {
    if(this.itemTarget.innerText === "") {
      this.toggleForm()
    }
  }

  update(event) {
    console.log("updating")
    const selectedValue = event.detail.value

    if(event.detail.value !== this.itemValue) {
      this.itemValue = selectedValue
      this.itemTarget.innerText = selectedValue
      this.toggleForm()
      this.post()
    }
  }

  post() {
    const value = this.itemValue
    const attribute = this.attributeValue
    const path = this.pathValue
    let params = { url: `/${path}`, type: "post" }

    if (this.itemIdValue) {
      params = { url: `/${path}/${this.itemIdValue}`, type: "patch" }
    }

    Rails.ajax({
      type: params["type"],
      dataType: "json",
      url: params["url"],
      data: `${attribute}=${value}`,
    })
  }

  toggleForm() {
    console.log("toggling form")
    this.showTarget.classList.toggle(this.hiddenClass)
    this.formTarget.classList.toggle(this.hiddenClass)
  }
}
