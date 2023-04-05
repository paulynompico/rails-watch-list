import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="new-list"
export default class extends Controller {
  static targets = ["infos", "form"]
  
  connect() {
    console.log("List controller connected");
  }


  displayForm() {
    this.infosTarget.classList.add("d-none")
    this.formTarget.classList.remove("d-none")
  }

  create(event) {
    event.preventDefault()
    const url = this.formTarget.action
    fetch(url, {
      method: "POST",
      headers: { "Accept": "text/plain" },
      body: new FormData(this.formTarget)
    })
      .then(response => response.text())
      .then((data) => {
        console.log(data)
      })
  }
}
