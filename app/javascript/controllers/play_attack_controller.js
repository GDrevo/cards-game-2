import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="play-attack"
export default class extends Controller {
  static targets = ["attackInput", "healInput", "submit", "ennemy", "ally"];

  connect() {
    // Attach click event listener to all card elements
    this.element.querySelectorAll(".ennemy-card").forEach(card => {
      card.addEventListener("click", event => {
        const targetId = card.dataset.targetId;
        this.attackInputTargets.forEach(target => {
          target.value = targetId
        });

        this.ennemyTargets.forEach(ennemyTarget => {
          if (ennemyTarget.classList.contains("selected-card")) {
            ennemyTarget.classList.remove("selected-card");
          }
        });

        this.element.querySelector("#title-ennemy-target").classList.add("hidden")
        this.element.querySelectorAll(".skill-ennemy-target").forEach(target => {
          target.classList.remove("blocked")
        });
        card.classList.add("selected-card");
      });
    });

    this.element.querySelectorAll(".ally-card").forEach(card => {
      card.addEventListener("click", event => {
        const targetId = card.dataset.targetId;
        this.healInputTarget.value = targetId;

        this.allyTargets.forEach(allyTarget => {
          if (allyTarget.classList.contains("selected-card")) {
            allyTarget.classList.remove("selected-card");
          }
        });

        this.element.querySelector("#title-ally-target").classList.add("hidden")
        this.element.querySelector("#skill-ally-target").classList.remove("blocked")
        card.classList.add("selected-card");
      });
    });
  }
}
