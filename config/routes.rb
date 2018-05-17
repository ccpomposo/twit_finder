Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'tweet/search'
  root 'tweet#search'

  get 'tweet/index' => 'tweet#index'
 
end
