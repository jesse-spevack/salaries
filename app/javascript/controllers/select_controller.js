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
    "item",
    "list",
    "selectItem"
  ]

  static values = { 
    attribute: String,
    item: String, 
    itemId: Number,
    path: String,
    selectItemIndex: Number
  }

  connect() {
  }

  initialize() {
    this.setChecks();
  }

  choose(event) {
    const newValue = event.target.innerText
    const detail = { selectValue: newValue }
    const selectEvent = new CustomEvent("select-event", { detail: detail })
    window.dispatchEvent(selectEvent)

    this.itemValue = newValue 
    this.itemTarget.innerText = newValue
    // for (let item of this.itemTargets) {
    //   item.innerText = newValue
    // }

    this.setChecks()
  }

  showList() {
    console.log("show list")
    if (this.listTarget.innerText !== "") {
      this.listTarget.classList.replace(this.hideClass, this.showClass)
      this.listTarget.classList.add("z-10")
    }
  }

  hideList() {
    console.log("hide list")
    this.listTarget.classList.replace(this.showClass, this.hideClass)
    this.listTarget.classList.remove("z-10")
  }

  highlight(event) {
    event.target.classList.remove(this.notHighlightedClass)
    event.target.classList.add(this.highlightedClass, this.backgroundHighlightedClass)
    event.target.lastElementChild.classList.remove(this.uncheckedClass)
    event.target.lastElementChild.classList.add(this.checkedClass)
  }

  // indexHighlight() {
  //   console.log(this.selectItemIndexValue)
  //   for (let [index, selectItem] of this.selectItemTargets.entries()) {
  //     if (index === this.selectItemIndexValue) {
  //       // console.log(selectItem)
  //       selectItem.lastElementChild.classList.remove(this.hiddenClass)
  //       selectItem.classList.remove(this.notHighlightedClass)
  //       selectItem.classList.add(this.highlightedClass, this.backgroundHighlightedClass)
  //       // highlight
  //     } else {
  //       // console.log(index)
  //       selectItem.lastElementChild.classList.add(this.hiddenClass)
  //       selectItem.classList.add(this.notHighlightedClass)
  //       selectItem.classList.remove(this.highlightedClass, this.backgroundHighlightedClass)
  //       // un highlight
  //     }
  //   }
  // }

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

  scrollUp() {
    const minIndex = 0 
    if (this.selectItemIndexValue > minIndex) {
      this.selectItemIndexValue--
    } else {
      // unhighlight 
    }

    // console.log(this.selectItemIndexValue)
  }

  scrollDown() {
    const maxIndex = this.selectItemTargets.length - 1
    if (this.selectItemIndexValue < maxIndex) {
      this.selectItemIndexValue++
    } else {
      // unhighlight
    }
    // console.log(this.selectItemIndexValue)
  }

  selectItemIndexValueChanged() {
    console.log(this.selectItemIndexValue)
    for (let [index, item] of this.selectItemTargets.entries()) {
      if (index === this.selectItemIndexValue) {
        item.classList.remove(this.notHighlightedClass)
        item.classList.add(this.highlightedClass, this.backgroundHighlightedClass)
        console.log(item)
      } else {
        item.classList.add(this.notHighlightedClass)
        item.classList.remove(this.highlightedClass, this.backgroundHighlightedClass)
      }
    }
  }
}
