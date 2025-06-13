Rails.application.routes.draw do
  mount_devise_token_auth_for "User", at: "auth" # make "/auth" endpoint for authentication
  resources :password_entries, except: [:new]
end
