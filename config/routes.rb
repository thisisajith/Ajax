Rails.application.routes.draw do
  resources :objs do 
  	member do
  	  patch :ajax
  	end
  end
  root "objs#index"
  
end
