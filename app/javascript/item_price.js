window.addEventListener('turbo:load', () => {
  const priceInput = document.getElementById("item-price")
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    const addTaxDom = document.getElementById("add-tax-price")
    addTaxDom.innerHTML = inputValue * 0.10
    const addCalcDom = document.getElementById("profit")
    addCalcDom.innerHTML = inputValue - (inputValue * 0.10)
    })
  });