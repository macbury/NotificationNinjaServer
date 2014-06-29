Rails.application.routes.draw do

  get '/login/gihtub' => redirect('/auth/github/'), as: :github

  get '/auth/:provider/callback', to: 'sessions#create'
  root "home#index"
end
