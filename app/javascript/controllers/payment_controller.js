// Visit The Stimulus Handbook for more details 
// https://stimulusjs.org/handbook/introduction
// 
// This example controller works with specially annotated HTML like:
//
// <div data-controller="hello">
//   <h1 data-target="hello.output"></h1>
// </div>

import { Controller } from "stimulus"
import dropin from "braintree-web-drop-in"

export default class extends Controller {
  static values = {
    token: String,
  }

  static targets = ["dropin", "nonce"]

  //頁面一load進來就做事
  connect(){
    // 刷卡表單
    const form = this.element.parentNode
    // console.log(123);
    dropin.create({
      container: this.dropinTarget,
      //取得tokenValue長出刷卡機表單
      authorization: this.tokenValue
    })
    .then((instance)=>{
      form.addEventListener("submit", (e) => {
        e.preventDefault()

        instance.requestPaymentMethod().then(({ nonce }) => {this.nonceTarget.value = nonce
          //確定form拿到noce後馬上送出
        form.submit();
        })
      })
    })
    .catch((err)=>{
      console.log("Error",err );
    })
   
  }
}
