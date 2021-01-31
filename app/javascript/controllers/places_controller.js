import { Controller } from "stimulus"

export default class extends Controller {
  static classes = [
  ]

  static targets = [ "field" ]

  static values = { 
  }

  connect() {
    if (typeof(google) != "undefined") {
      this.initMap()
    }
  }

  initMap() {
    this.autocompleteService = new google.maps.places.AutocompleteService()
    this.autocompleteService.getPlacePredictions({ input: "Amst", types: ["(cities)"] }, this.logResult)
    // this.autocomplete = new google.maps.places.Autocomplete(this.fieldTarget)
    // this.autocomplete.setTypes = "(Cities)"
  }

  logResult(res) {
    console.log(res)
  }
}


