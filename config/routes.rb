Rails.application.routes.draw do
  devise_for :users
  get 'pages/about'
  get 'pages/contact'
  root 'listings#index'#sets root file to all listings
  get 'seller' => 'listings#seller' #creates a new url at localhost/seller

  resources :listings do #tell rails to include listing id number in URL for orders pages
  resources :orders
  end
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
