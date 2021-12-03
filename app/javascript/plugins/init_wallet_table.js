const initWalletTable = () => {
  const totalInvested = document.querySelector("#totalinvested") //atualizar
  const totalProfit = document.querySelector("#totalprofit") //atualizar
  const totalPercent = document.querySelector("#totalpercent") //atualizar

  const rows = document.querySelectorAll(".coinrow")
    rows.forEach((row) => {
      const amount = row.querySelector(".amount")
      const buying_price = row.querySelector(".buying_price")
      const cost = row.querySelector(".cost") //atualizar
      const price = row.querySelector(".price")
      const dif = row.querySelector(".dif") //atualizar
      const profit = row.querySelector(".profit") //atualizar
      //const portfolio = row.querySelector(".portfolio") //atualizar
    })
}
