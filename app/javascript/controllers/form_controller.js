import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["form"]
  connect() {
    console.log("je suis dans mon controller")
  }

  test(event) {
    event.preventDefault();
    this.formTarget.classList.toggle("d-none")
  }
}
