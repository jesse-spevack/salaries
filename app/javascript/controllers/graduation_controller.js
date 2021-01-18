// Visit The Stimulus Handbook for more details 
// https://stimulusjs.org/handbook/introduction
// 
// This example controller works with specially annotated HTML like:
//
// <div data-controller="hello">
//   <h1 data-target="hello.output"></h1>
// </div>

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
    "notSelectedItemFont",
    "selectedItemFont",
    "show",
    "unchecked",
  ]

  static targets = [
    "check",
    "form",
    "item",
    "graduationYearText",
    "list",
    "select",
    "show",
  ]

  static values = { 
    graduationYear: Number, 
    profileId: Number 
  }

  initialize() {
    this.setChecks();
    if(!this.graduationYearValue) {
      this.showForm();
    }
  }

  selectGraduationYear() {
    this.graduationYearValue = event.target.innerText
    this.graduationYearTextTargets.forEach(function(target) {
      target.innerText = event.target.innerText
    }.bind(this))
    this.hideForm()
    this.setChecks()

    var params = { url: "/profiles", type: "post" }
    if (this.profileIdValue) {
      params = { url: `/profiles/${this.profileIdValue}`, type: "patch" }
    }
    Rails.ajax({
      type: params["type"],
      dataType: "json",
      url: params["url"],
      data: `graduation_year=${event.target.innerText}`,
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

  handleFailure() {
    console.log("something went wrong")
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
    this.itemTargets.forEach(function(item){
      if (item.innerText != this.graduationYearValue) {
        item.lastElementChild.classList.add(this.hiddenClass)
      } else {
        item.lastElementChild.classList.remove(this.hiddenClass)
      }
    }.bind(this))
  }
}
