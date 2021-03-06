Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks', registrations: "registrations" }
  resources :users, only: %w[index show update ]

  root to: 'cities#home'

  resources :cities, only: %w[new create edit update]
  resources :cities, only: %w[show] do 
    resources :events, only: %w[index new create]
    resources :faq, only: %w[index]
    resources :events, only: %w[index show]
    resources :headlines, only: %w[index]
    resources :chatrooms, only: :show
    resources :forums, only: %w[] do 
      resources :posts, only: %w[index]
    end 
  end
  resources :forums, only: [] do 
    resources :posts, only: %w[create]
  end 
  resources :posts, only: %w[destroy] do 
    resources :comments, only: %w[create]
  end 
  resources :chatrooms, only: [] do
    resources :messages, only: %w[create]
  end 
  resources :locations, only: %w[index]
end
