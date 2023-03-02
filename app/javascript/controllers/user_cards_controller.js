import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="user-cards"
export default class extends Controller {
  static targets = ["card", "submission", "playButton", "cardIds"]

  connect() {
    console.log("Hello")
  }

  selectedCards = []

  selectCard(event) {
    const cardId = event.currentTarget.dataset.cardId;
    const selectedCardsCount = this.selectedCards.length + 1;


    if (selectedCardsCount <= 5 && !this.selectedCards.includes(cardId)) {
      this.selectedCards.push(cardId)
      this.submissionTarget.insertAdjacentHTML("beforeend", `<input type="hidden" name="card_ids[]" value="${cardId}" />`)
      console.log("This is the selectedCards if it doesn't include")
      console.log(this.selectedCards)
      this.updatePlayButton()
    } else if (this.selectedCards.includes(cardId)) {
      const index = this.selectedCards.indexOf(cardId)
      console.log("Selected Cards:")
      console.log(this.selectedCards)
      console.log("Include :")
      console.log(cardId)
      this.selectedCards.splice(index, 1)
      const input = this.submissionTarget.querySelector(`input[name="card_ids[]"][value="${cardId}"]`)
      console.log("This is the input :")
      console.log(input)
      if (input) {
        input.parentNode.removeChild(input)
      }
      // this.selectedCards.splice(cardId)
    }

    if (selectedCardsCount > 0 && selectedCardsCount <= 5) {
      this.playButtonTarget.disabled = false
    }

    this.cardTargets.forEach(cardTarget => {
      if (this.selectedCards.includes(cardTarget.dataset.cardId)) {
        cardTarget.classList.add("selected")
      } else {
        cardTarget.classList.remove("selected")
      }
    });
  }

  updatePlayButton() {
    const selectedCardIds = Array.from(this.selectedCards)
    this.submissionTarget.dataset.cardIds = selectedCardIds.join(',')
  }
}
