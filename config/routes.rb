Rails.application.routes.draw do
  resources :channels

  namespace :api, default: { format: :json } do
    namespace :v1 do
      post "/register" => "device#register", as: :register
      post "/push/:token" => "channel#push", as: :push
      post "/subscribe/:token" => "channel#subscribe", as: :subscribe
    end
  end

  get '/login/gihtub' => redirect('/auth/github/'), as: :github
  get '/logout', to: "sessions#destroy"
  get '/auth/:provider/callback', to: 'sessions#create'
  root "home#index"
end
