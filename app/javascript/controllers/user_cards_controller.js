import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="user-cards"
export default class extends Controller {
  static targets = ["card", "selection", "playButton", "cardIds"]

  connect() {
    console.log("Hello")
  }

  selectedCards = []

  selectCard(event) {
    const cardId = event.currentTarget.dataset.cardId;
    const selectedCardsCount = this.selectedCards.length + 1;

    if (selectedCardsCount <= 5 && !this.selectedCards.includes(cardId)) {
      this.selectedCards.push(cardId)
      this.selectionTarget.insertAdjacentHTML("beforeend", `<input type="hidden" name="card_ids[]" value="${cardId}" />`)
      this.updatePlayButton(cardId)
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

  updatePlayButton(cardId) {
    const selectedCardIds = Array.from(this.selectedCards)
    console.log(this.selectedCards)
    this.playButtonTarget.dataset.cardIds = selectedCardIds.join(',')
  }
}
