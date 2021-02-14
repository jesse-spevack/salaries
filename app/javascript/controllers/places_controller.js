import { Controller } from "stimulus"

export default class extends Controller {
  static values = { env: String }

  getList (event) {
    const searchString = event.target.value
    if (searchString !== "") {
      // This is tech debt - need to figure out how to not call this api in system tests
      if (this.envValue === "test") {
        this.publish(this.testPredictions())
      } else {
        this.autocompleteService = new google.maps.places.AutocompleteService()
        this.autocompleteService.getPlacePredictions({ input: searchString, types: ["(cities)"] }, this.publish)
      }
    }
  }

  publish (predictions) { 
    const details = []
    for (const prediction of predictions) {
      const description = prediction.description
      const placeId = prediction.place_id
      details.push({ description: description, placeId: placeId })
    }

    const event = new CustomEvent("place-event", { detail: details })
    window.dispatchEvent(event)
  }

  testPredictions () {
    return [{
      description: "TEST - Denver, CO, USA - TEST",
      placeId: "1234567890"
    }]
  }
}
