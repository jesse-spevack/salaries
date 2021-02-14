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
    selectItemIndex: Number,
    validPlaces: Array
  }

  populateList (event) {
    const places = event.detail
    const ul = this.listTarget.firstElementChild
    const li = ul.firstElementChild
    let validPlaces = []

    while(ul.firstChild) {
      ul.removeChild(ul.lastChild)
    }

    for (const place of places)  {
      let newLi = li.cloneNode(true)
      let placeName = place.description
      let placeId = place.placeId
      let validPlace = { name: placeName, placeId: placeId }
      validPlaces.push(validPlace)

      newLi.firstElementChild.innerText = placeName 
      newLi.classList.remove("bg-indigo-600", "text-white")
      newLi.lastElementChild.classList.add("hidden")
      ul.appendChild(newLi)
    }

    this.validPlacesValue = validPlaces
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
    const validPlace = this.validPlacesValue.find(validPlace => {
      return (validPlace.name == newValue)
    })

    const newPlaceId = validPlace.placeId

    this.itemValue = newValue 
    this.placeIdValue = newPlaceId 
    this.placeIdTarget.value = newPlaceId 
    this.inputTarget.value = newValue

    const searchListValidEntryDetected = new CustomEvent("search-list-valid-entry-detected-event")
    window.dispatchEvent(searchListValidEntryDetected)

    this.setChecks()
    this.hideList()
  }

  emitInvalidEntryDetectedEvent () {
    const searchListInvalidEntryDetected = new CustomEvent("search-list-invalid-entry-detected-event")
    window.dispatchEvent(searchListInvalidEntryDetected)
  }
}
