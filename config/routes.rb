Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "articles#index"
  
  get "about", to: "about#index"
  get "contact", to: "about#contact"

  resources :articles do
    resources :comments
  end
end
