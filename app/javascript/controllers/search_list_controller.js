import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "list" ]

  populateList (event) {
    const places = event.detail
    const ul = this.listTarget.firstElementChild
    const li = ul.firstElementChild

    while(ul.firstChild) {
      ul.removeChild(ul.lastChild)
    }

    for (const place of places)  {
      console.log(place.description)
      let newLi = li.cloneNode(true)
      console.log(newLi.firstElementChild)
      newLi.firstElementChild.innerText = place.description
      ul.appendChild(newLi)
    }
  }
}
