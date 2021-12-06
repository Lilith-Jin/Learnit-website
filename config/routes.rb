Rails.application.routes.draw do
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

    #/api/v1/courses/2/like
    namespace :api do
      namespace :v1 do
        resources :courses, only: [] do
          member do
            post :like #like路徑包在courses裡面
          end
        end
      end
    end
    
  
    #/courses
      resources :courses do
        member  do
          get :buy
        end
      #resources :reviews, shallow :true (自動長出巢狀路徑)
      resources :reviews, only:[:create] #現在專案用到的action少 手動新增需要的就好
      # /orders 跟course有關，所以需要id
      resources :orders, only:[:create] #post course/:id/orders
    end
      resources :reviews, only:[:destroy] #與course id無關
    #首頁
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
