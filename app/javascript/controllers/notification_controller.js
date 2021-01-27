import { Controller } from "stimulus"

export default class extends Controller {
  connect () {
    this.element.classList.remove('hidden')
    setTimeout(() => {
      this.close()
    }, 5500)
  }

  close () {
    this.element.remove()
  }
}
