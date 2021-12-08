const initWalletTable = () => {
  const totalInvested = document.querySelector("#totalinvested") //atualizar
  const totalProfit = document.querySelector("#totalprofit") //atualizar
  const totalPercent = document.querySelector("#totalpercent") //atualizar
  const totalBrut = document.querySelector("#totalbrut") //atualizar

  const rows = document.querySelectorAll(".coinrow")
    rows.forEach((row) => {
      const amount = row.querySelector(".amount")
      const buying_price = row.querySelector(".buying_price")
      const cost = row.querySelector(".cost") //atualizar
      const price = row.querySelector(".price")
      const dif = row.querySelector(".dif") //atualizar
      const profit = row.querySelector(".profit") //atualizar
      const actualBrut = row.querySelector(".actual-brut") //atualizar

      //updating costs
      cost.innerText = parseInt(buying_price.innerText, 10) * parseInt(amount.innerText, 10)
      //updating dif
      let difference = (parseInt(price.innerText, 10) / parseInt(buying_price.innerText, 10) - 1) * 100
      dif.innerText = Math.round(difference * 100) / 100
      //updating profit
      profit.innerText = (parseInt(price.innerText, 10) - parseInt(buying_price.innerText, 10)) * parseInt(amount.innerText, 10)

      //updating actual-brut
      actualBrut.innerText = parseInt(price.innerText, 10) * parseInt(amount.innerText, 10)

    })

      //updating totalinvested
      let costs = []
      const costsArray = document.querySelectorAll(".cost")
      costsArray.forEach((cost) => {
        costs.push(cost)
      })
      costs = costs.map((element) => {
       return parseInt(element.innerText, 10)
      })
      totalInvested.innerText = costs.reduce((previousValue, currentValue) => previousValue + currentValue)

      //updating totalprofit
      let profits = new Array
      const profitsArray = document.querySelectorAll(".profit")
      profitsArray.forEach((profit) => {
        profits.push(profit)
      })
      profits = profits.map((element) => {
        return parseInt(element.innerText, 10)
      })
      totalProfit.innerText = profits.reduce((previousValue, currentValue) => previousValue + currentValue)
      //updating totaldif
      let totalDifference = parseInt(totalProfit.innerText, 10) / parseInt(totalInvested.innerText, 10) * 100
      totalPercent.innerText = Math.round(totalDifference * 100) / 100

      //updating totalbrut
      let bruts = new Array
      const brutsArray = document.querySelectorAll(".actual-brut")
      brutsArray.forEach((brut) => {
        bruts.push(brut)
      })
      bruts = bruts.map((element) => {
        return parseInt(element.innerText, 10)
      })
      totalBrut.innerText = bruts.reduce((previousValue, currentValue) => previousValue + currentValue)

      //updating totalbrut%

    rows.forEach((row) => {
      const actualBrut = row.querySelector(".actual-brut") //atualizar
      const portfolio = row.querySelector(".portfolio") //atualizar

      let actualBrutValue = parseInt(actualBrut.innerText, 10)
      let totalBrutValue = parseInt(totalBrut.innerText, 10)
      let portfolioCount = (actualBrutValue / totalBrutValue * 100)
      console.log(portfolioCount)
      if (isNaN(parseFloat(portfolioCount))) {
        portfolio.innerHTML = 100 + "%"
      } else {
        portfolio.innerHTML = portfolioCount + "%"
      }
    })
}
export { initWalletTable }
