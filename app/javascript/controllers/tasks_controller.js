import {Controller} from "@hotwired/stimulus"

export default class extends Controller {
    connect() {
        console.log(this.element)
    }

    toggle(e) {
        const id = e.target.dataset.id
        const csrfToken = document.querySelector("[name='csrf-token']").content
        const params = {}

        fetch(`/tasks/${id}/toggle`, {
                method: 'POST',
                mode: 'cors',
                cache: 'no-cache',
                credentials: 'same-origin',
                headers: {
                    'Content_Type': 'application/json',
                    'X-CSRF-Token': csrfToken
                },
                body: JSON.parse(e.target.checked),
            }
        )
            .then(response => response.json())
    }
}