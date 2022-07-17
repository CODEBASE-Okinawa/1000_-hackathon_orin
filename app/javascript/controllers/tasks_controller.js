import {Controller} from "@hotwired/stimulus"

export default class extends Controller {
    toggle(e) {
        const id = e.target.dataset.id
        const csrfToken = document.querySelector("[name='csrf-token']").content

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
            .then(location.reload())
            .catch((error) => {
                console.error('Error', error);
            });

    }
}