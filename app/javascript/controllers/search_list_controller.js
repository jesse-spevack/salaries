import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ 
    "list",
    "input",
    "placeId",
    "selectItem",
    "value"
  ]

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

  static values = { 
    attribute: String,
    item: String, 
    itemId: Number,
    path: String,
    placeId: String,
    selectItemIndex: Number
  }

  populateList (event) {
    const places = event.detail
    const ul = this.listTarget.firstElementChild
    const li = ul.firstElementChild

    while(ul.firstChild) {
      ul.removeChild(ul.lastChild)
    }

    for (const place of places)  {
      let newLi = li.cloneNode(true)
      newLi.firstElementChild.innerText = place.description
      newLi.id = place.placeId
      newLi.classList.remove("bg-indigo-600", "text-white")
      newLi.lastElementChild.classList.add("hidden")
      ul.appendChild(newLi)
    }

    this.showList()
  }

  showList() {
    if (this.listTarget.innerText !== "") {
      this.listTarget.classList.replace(this.hideClass, this.showClass)
      this.listTarget.classList.add("z-10")
      this.listTarget.classList.remove("hidden")
    }
  }

  hideList(event) {
    console.log("hiding")
    this.listTarget.classList.replace(this.showClass, this.hideClass)
    this.listTarget.classList.remove("z-10")
    this.listTarget.classList.add("hidden")
  }

  highlight(event) {
    event.target.classList.remove(this.notHighlightedClass)
    event.target.classList.add(this.highlightedClass, this.backgroundHighlightedClass)
    event.target.lastElementChild.classList.remove(this.uncheckedClass)
    event.target.lastElementChild.classList.add(this.checkedClass)
  }

  removeHighlight(event) {
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

  choose (event) {
    const newValue = event.target.innerText
    const placeId = event.target.id

    this.itemValue = newValue 
    this.placeIdValue = placeId 
    this.inputTarget.value = newValue

    this.setChecks()
    this.hideList()
  }

  placeIdValueChanged() {
    this.placeIdTarget.value = this.placeIdValue
    console.log("place id changed")
  }
}
