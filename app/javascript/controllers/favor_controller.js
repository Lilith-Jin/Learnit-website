// Visit The Stimulus Handbook for more details 
// https://stimulusjs.org/handbook/introduction
// 
// This example controller works with specially annotated HTML like:
//
// <div data-controller="hello">
//   <h1 data-target="hello.output"></h1>
// </div>

import { Controller } from "stimulus"
import httpClient from "lib/http/client"

export default class extends Controller {
  // static targets = [ "output" ]
  static targets = [ "btn" ]
  static values = {
    liked: Boolean,
    courseId: Number,
  }

  //頁面一load進來就做事
  connect(){
    console.log(this.likedValue);
    if(this.likedValue){
      this.btnTarget.classList.add("favorited")
    }
    // if(likeBtn.dataset.lked === "true"){
    //   likeBtn.classList.add("favorited")
    // }
  }

  like() {
    // this.outputTarget.textContent = 'Hello, Stimulus!'
    // console.log(this.btnTarget.dataset.id);
    // const courseID = this.btnTarget.dataset.id
    const courseID = this.courseIdValue
    const likeBtn = this.btnTarget

    httpClient.post(`/api/v1/courses/${courseID}/like`)
      .then(({data})=>{
        // console.log(data)
        if (data.result === 'like'){
          // this.btnTarget.classList.add("favorited")
          likeBtn.classList.add("favorited")

        }else{
          likeBtn.classList.remove("favorited")
        }
      })
  }
}
