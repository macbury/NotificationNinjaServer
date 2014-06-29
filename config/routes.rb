Rails.application.routes.draw do
  resources :channels

  namespace :api do
    namespace :v1 do
      post "/subscribe/:token" => "test#test"
      post "/push/:token" => "test#test"
    end
  end

  get '/login/gihtub' => redirect('/auth/github/'), as: :github
  get '/logout', to: "sessions#destroy"
  get '/auth/:provider/callback', to: 'sessions#create'
  root "home#index"
end
