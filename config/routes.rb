Rails.application.routes.draw do

  # Redirect all requests for '/' to Dashboard 'index':
  root to: 'dashboard#index'

  # Bulk define routes for InstructionSession controller/views,
  # Override default path with '/sessions'.
  resources :instruction_sessions, path: 'sessions'

  resources :students, only: [ 'index', 'show' ]

  resources :dashboard, only: [ 'index' ]

end
