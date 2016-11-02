Rails.application.routes.draw do
  #resources :details_matches
  #resources :matches
  resources :matches 
  resources :players
  resources :teams
  resources :events
  resources :championships
  devise_for :users, controllers:{
  	 omniauth_callbacks: "users/omniauth_callbacks"
  }
  post "/custom_sign_up", to: "users/omniauth_callbacks#custom_sign_up"


  authenticated :user do
  	root 'main#home'
  end




  unauthenticated :user do
  	root 'main#unregistered'
  end

  
  get  'matches-create' => 'matches#generate_form'
  post 'matches-generate' => 'matches#generate'
  
  get  'details_match/:match_id/new'    => 'details_matches#new_detail'
  post 'details_match/:match_id/create' => 'details_matches#create_detail'

  get  'search-players' => 'players#search'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
