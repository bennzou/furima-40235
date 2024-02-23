const pay = () => {
  const publicKey = gon.public_key;
  const payjp = Payjp(publicKey); // PAY.JPテスト公開鍵
  const elements = payjp.elements();
  const numberElement = elements.create('cardNumber');
  const expiryElement = elements.create('cardExpiry');
  const cvcElement = elements.create('cardCvc');

  numberElement.mount('#number-form');
  expiryElement.mount('#expiry-form');
  cvcElement.mount('#cvc-form');

  const form = document.getElementById('charge-form');
  form.addEventListener('submit', (e) => {
    payjp.createToken(numberElement).then(function (response) {
      if (response.error) {
        // エラーが発生した場合の処理を追加
        console.error(response.error.message);
      } else {
        const token = response.id;
        const renderDom = form; // form を使うように修正
        const tokenObj = `<input value=${token} name='token' type="hidden">`;
        renderDom.insertAdjacentHTML('beforeend', tokenObj);
      }
      numberElement.clear();
      expiryElement.clear();
      cvcElement.clear();
      // フォームの送信
      form.submit();
    });
    e.preventDefault();
  });
};

window.addEventListener('turbo:load', pay);
window.addEventListener('turbo:render', pay);