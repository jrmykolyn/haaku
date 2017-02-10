Rails.application.routes.draw do

  # Redirect all requests for '/' to Dashboard 'index':
  root to: 'dashboard#index'

  # 'Skip' (remove) default Devise 'route helper'.
  devise_for :users, :skip => [:sessions, :registrations]

  # Define project-specific routes and 'route helpers' below.
  as :user do
	# Define 'login'/'logout' routes:
	get "/login" => "devise/sessions#new", :as => :new_login
	post "/login" => "devise/sessions#create", :as => :login
	get "/logout" => "devise/sessions#destroy", :as => :logout

	# Define 'signup' routes:
	get "/signup" => "devise/registrations#new", :as => :new_signup
	post "/signup" => "devise/registrations#create", :as => :signup
  end

  # Bulk define routes for InstructionSession controller/views,
  # Override default path with '/sessions'.
  resources :instruction_sessions, path: 'sessions'

  resources :students
  resources :cohorts

  resources :dashboard, only: [ 'index' ]

end
