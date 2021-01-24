Rails.application.routes.draw do
  scope module: :api do
    scope module: :v1 do
    	resources :repositories, only: [:index]
    	resources :searches, only: [:index]
    	resources :users, only: [] do
	    	get 'repositories'
    	end
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
