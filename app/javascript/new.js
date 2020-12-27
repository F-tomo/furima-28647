window.addEventListener('load', function(){

  const priceInput = document.getElementById("price")

  priceInput.addEventListener('input', function(){

    const tax = document.getElementById("add-tax-price")
    const taxInt = priceInput.value * 0.1;
    tax.innerHTML = parseInt(taxInt);

    const profit = document.getElementById("profit")
    profit.innerHTML = priceInput.value - parseInt(taxInt);

  })

})