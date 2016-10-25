Rails.application.routes.draw do

  # Redirect all requests for '/' to InstructionSession index:
  root to: 'instruction_sessions#index'

  # Bulk define routes for InstructionSession controller/views,
  # Override default path with '/sessions'.
  resources :instruction_sessions, path: 'sessions'
  resources :students, only: [ 'index' ]

end
