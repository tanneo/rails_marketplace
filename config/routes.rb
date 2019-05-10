Rails.application.routes.draw do
  devise_for :users
  get 'pages/about'
  get 'pages/contact'
  root 'listings#index'#sets root file to all listings
  get 'seller' => 'listings#seller' #creates a new url at localhost/seller
  get 'sales' => "orders#sales" #set up new url for sales to see order history
  get 'purchases' => "orders#purchases" #set up new url for purchases to see order history
  

  resources :listings do #tell rails to include listing id number in URL for orders pages
  resources :orders, only: [:new, :create] #tells rails that only URLS it needs to worry about when it comes to orders is for new and create actions
  end
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
