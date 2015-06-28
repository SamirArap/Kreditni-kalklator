Rails.application.routes.draw do
  
  root 'loan#index'

  #post 'loan/calculate'
  match ':controller(/:action)', :via => [:get, :post]

 
end
