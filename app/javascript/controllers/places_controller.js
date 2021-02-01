import { Controller } from "stimulus"

export default class extends Controller {
  getList (event) {
    const searchString = event.target.value
    if (searchString !== "") {
      this.autocompleteService = new google.maps.places.AutocompleteService()
      this.autocompleteService.getPlacePredictions({ input: searchString, types: ["(cities)"] }, this.publish)
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
}
