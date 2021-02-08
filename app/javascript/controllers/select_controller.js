import { Controller } from "stimulus"
import Rails from "@rails/ujs";

export default class extends Controller {
  static classes = [
    "hidden",
    "z"
  ]

  static targets = [
    "item",
    "list"
  ]

  static values = { 
    item: String
  }

  setSelected(event) {
    console.log("select item changed")
    const selectedValue = event.detail.value
    this.itemValue = selectedValue 
    this.itemTarget.innerText = selectedValue
  }

  selectItemChanged() {
    this.hideList()
  }

  showList() {
    console.log("showing list")
    this.listTarget.classList.remove(this.hiddenClass)
    this.listTarget.classList.add(this.zClass)
  }

  hideList() {
    console.log("hiding list")
    this.listTarget.classList.add(this.hiddenClass)
    this.listTarget.classList.remove(this.zClass)
  }
}
