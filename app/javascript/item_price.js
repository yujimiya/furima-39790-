window.addEventListener('turbo:load', () => {
  const priceInput = document.getElementById("item-price")
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    const addTaxDom = document.getElementById("add-tax-price")
    addTaxDom.innerHTML =Math.floor(inputValue * 0.10)
    const addCalcDom = document.getElementById("profit")
    addCalcDom.innerHTML = Math.floor(inputValue - (inputValue * 0.10))
    })
  });