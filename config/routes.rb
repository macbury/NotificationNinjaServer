Rails.application.routes.draw do
  resources :channels

  namespace :api, default: { format: :json } do
    namespace :v1 do
      post "/subscribe/:token" => "test#test", as: :subscribe
      post "/push/:token" => "test#test", as: :push
    end
  end

  get '/login/gihtub' => redirect('/auth/github/'), as: :github
  get '/logout', to: "sessions#destroy"
  get '/auth/:provider/callback', to: 'sessions#create'
  root "home#index"
end
