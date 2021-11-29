Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

    resources :courses do
      #resources :reviews, shallow :true (自動長出巢狀路徑)
      resources :reviews, only:[:create] #因為用到的action少 手動新增需要的就好
    end
      resources :reviews, only:[:destroy] #

    root "courses#index"

    # get "/", to: "pages#index"
    get "/about", to: "pages#about"

    #user's action
    #會員註冊
    get "/sign_up", to: "users#sign_up"
    post"/account_verify", to: "users#account_verify"

    #會員登入
    get "/sign_in", to: "users#sign_in"
    post "/check", to: "users#check"
    
    #會員登出
    delete "/sign_out", to: "users#sign_out"
end
