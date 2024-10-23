# config/routes.rb in Frontend
Rails.application.routes.draw do
  
  get '/sign_up', to: 'registrations#new', as: :sign_up # Shows the registration form
  post '/sign_up', to: 'registrations#create' # Submits form data to the backend API for user registration
  
  # Login Routes (handled in Frontend)
  get '/login', to: 'sessions#new', as: :login # Shows the login form
  post '/login', to: 'sessions#create' # Submits login credentials to backend API
  
  # Logout Route (handled in Frontend)
  delete '/logout', to: 'sessions#destroy', as: :logout # Clears JWT token on frontend and logs out the user

  # Example of Protected Route (only accessible if logged in)
  get '/dashboard', to: 'dashboard#show', as: :dashboard # Shows protected dashboard page

  # Root Path
  root to: 'home#index' # Home page of your frontend application
end
