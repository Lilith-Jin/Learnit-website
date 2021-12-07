 //aaa是方法名稱(自己取)，/node Model/axios
// import axios from "axios"
// import httpClient from "lib/http/client"

// //turbolinks:load 讓JS可以重複讀取

// document.addEventListener("turbolinks:load",()=>{
//   const btn = document.querySelector("#like-btn")
//   //有btn才出現，不然會壞(因為這是全站的JS不是做在單頁)
//   if (btn){
//     btn.addEventListener("click",()=>{
//       // console.log(btn);
//       const courseID = btn.dataset.id
//       // console.log(btn.dataset.id);
//       // httpClient.post("/api/v1/courses/2/like")
//       httpClient.post(`/api/v1/courses/${courseID}/like`)
//       .then(({data})=>{
//         // console.log(data)
//         if (data.result === 'like'){
//           btn.classList.add("favorited")
//         }else{
//           btn.classList.remove("favorited")
//         }
//       //抓<meta>
//       // const csrfToken = document.querySelector("meta[name=csrf-token]").content
//       // console.log(csrfToken);
//       // console.log(csrfToken.content);
//       // axios.defaults.headers.common['X-CSRF-Token'] = csrfToken
//       // console.log(csrfToken);
//       //透過API來紀錄按讚資料
//       // httpClient.post("/api/v1/courses/2/like")
//       // .then((resp)=>{
//       //   console.log(resp);
//       //   btn.classList.add("favorited")
//       //   btn.classList.remove('txt')
//         // data.results.forEach((u) => {
//           // console.log(u.email);
//         // });
//     //   })
//     // })
//       })
//     }) 
//   }  
// })