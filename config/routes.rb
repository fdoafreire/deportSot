Rails.application.routes.draw do
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
  get  'matches/:match_id/close' => 'matches#close'
  get  'search-players' => 'players#search'
  get  'staticstics/table-positions' => 'staticstics#table_positions'
  get  'staticstics/table-events' => 'staticstics#table_players_goals'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
