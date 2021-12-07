      import ax from "axios"

      const csrfToken = document.querySelector("meta[name=csrf-token]").content
      // console.log(csrfToken);
      // console.log(csrfToken.content);
      // if (content){
        ax.defaults.headers.common['X-CSRF-Token'] = csrfToken
      // }
      
      export default ax