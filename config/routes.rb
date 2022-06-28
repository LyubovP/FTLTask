Rails.application.routes.draw do
  devise_for :users

  root to: "cards#index"

  get :search, to: 'search#search' 

  resources :cards do
    resources :items
         
  end

  get "/help", to: "help#help"
end
