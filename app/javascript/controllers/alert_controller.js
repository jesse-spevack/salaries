import { Controller } from "stimulus"
import Rails from "@rails/ujs";

export default class extends Controller {
  static classes = [ "hidden" ]
  static targets = [ "alert", "row" ]
  static values = {
    id: Number,
    alertId: Number,
    path: String
  } 

  cancel() { 
    this.alertTarget.classList.add(this.hiddenClass)
  }

  show(event) {
    this.alertTarget.classList.remove(this.hiddenClass)
    const id = this.getClosest(event.target, "data-alert-id-value")
    this.alertIdValue = id
  }

  delete() {
    for (let row of this.rowTargets) {
      if(row.getAttribute("data-alert-id-value") == this.alertIdValue) {
        row.classList.add(this.hiddenClass)
        this.alertTarget.classList.add(this.hiddenClass)
      }
    }

    Rails.ajax({
      type: "delete",
      url: `/${this.pathValue}/${this.alertIdValue}`
    })
  }

  getClosest(element, dataAttribute) {
    for (; element && element !== document; element = element.parentNode) {
      if (element.getAttribute(dataAttribute)) {
        return element.getAttribute(dataAttribute);
      }
    }
    return null;
  }
}
