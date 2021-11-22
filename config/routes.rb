Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

    resources :courses
    root "courses#index"

    # get "/", to: "pages#index"
    get "/about", to: "pages#about"

    #user's action
    get "/sign_up", to: "users#sign_up"
    post"/account_verify", to: "users#account_verify"

    get "/sign_in", to: "users#sign_in"
    post "/check", to: "users#check"

    delete "/sign_out", to: "users#sign_out"
end
