// Visit The Stimulus Handbook for more details
// https://stimulusjs.org/handbook/introduction
//
// This example controller works with specially annotated HTML like:
//
// <div data-controller="hello">
//   <h1 data-target="hello.output"></h1>
// </div>

import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "price", "total", "startDay", "endDay", "days" ]

  connect() {
    console.log(this.dateTarget)
    console.log(this.totalTarget)
    console.log(this.startDayTarget.value)
    console.log(this.endDayTarget)
  }


  calculate(){

  const startday = new Date(this.startDayTarget.value)
  const endday = new Date(this.endDayTarget.value)

  if (this.startDayTarget.value !== "" && this.endDayTarget.value !== ""){

    const days = (endday - startday) / (1000 * 3600 * 24) + 1

    this.daysTarget.innerText = days
    const price = parseInt(this.priceTarget.innerText)
    const total = days * price

    this.totalTarget.innerText = total
  }

}

}
