function price() {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
  const inputValue = priceInput.value;
  const addTaxDom = document.getElementById("add-tax-price");
  const ProfitDom = document.getElementById("profit");
  addTaxDom.innerHTML = Math.floor(inputValue * 0.1);
  ProfitDom.innerHTML = inputValue - addTaxDom.innerHTML;
  })
};
window.addEventListener("turbo:load", price);
window.addEventListener("turbo:render", price);