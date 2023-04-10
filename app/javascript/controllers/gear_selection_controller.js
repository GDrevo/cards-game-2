import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="gear-selection"
export default class extends Controller {
  static targets = ["chp", "carmor", "cpower", "cspeed", "nhp", "narmor", "npower", "nspeed", "cgearid", "ngearid", "sgearid"]

  connect() {
  }

  selectGear(event) {
    const cGearId = event.currentTarget.dataset.id
    const hpBonus = event.currentTarget.dataset.hpBonus
    const armorBonus = event.currentTarget.dataset.armorBonus
    const powerBonus = event.currentTarget.dataset.powerBonus
    const speedBonus = event.currentTarget.dataset.speedBonus

    const hpCurrent = this.chpTarget.innerText
    const armorCurrent = this.carmorTarget.innerText
    const powerCurrent = this.cpowerTarget.innerText
    const speedCurrent = this.cspeedTarget.innerText
    console.log(powerCurrent)

    this.nhpTarget.innerText = "Hit Points : " + hpBonus
    this.narmorTarget.innerText = "Armor : " + armorBonus
    this.npowerTarget.innerText = "Power : " + powerBonus
    this.nspeedTarget.innerText = "Speed : " + speedBonus

    this.ngearidTarget.value = cGearId
    this.sgearidTarget.value = cGearId
  }
}
