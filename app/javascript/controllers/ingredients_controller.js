import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "available" ]

  toggle(event) {
    const token = document.getElementsByName('csrf-token')[0].content;
    const element = this.availableTarget
    const availability = element.checked
    const formData = new FormData()

    formData.append("available", availability);

    fetch(this.data.get("update-url"), {
      body: formData,
      method: 'PATCH',
      credentials: "include",
      dataType: "script",
      headers: {
              "X-CSRF-Token": token
       },
    })
    .then(function(response) {
      if (response.status != 204) {
          event.target.checked = !event.target.checked
      }
  })
  }
}
