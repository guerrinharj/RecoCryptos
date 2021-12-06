const headIndexFixer = () => {



  const tableHeaders = document.querySelectorAll(".head_crypto_table th");


  tableHeaders.forEach(tablehead => {

    const sticky = tablehead.offsetTop


    window.addEventListener('scroll', () => {
      if (window.pageYOffset > sticky) {
        console.log(window.pageYOffset)
        tablehead.classList.add("sticky")
      } else {
        tablehead.classList.remove("sticky")
      }
    })

  })



}

export { headIndexFixer }
