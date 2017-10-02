Rails.application.routes.draw do
  # resources :contacts do
  # end
	resources :friends, controller: :contacts, type: 'Friend'
	resources :emergencies, controller: :contacts, type: 'Emergency'
  
  root 'contacts#index'
end
