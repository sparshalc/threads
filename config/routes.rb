Rails.application.routes.draw do
  mount Notifications::Engine => "/notifications"
  get 'recent/post'
  get 'recent/posts'
  resources :user, only: [:show, :index]
  devise_for :users, :controllers => {
    registrations: 'users/registrations'
  }
  resources :posts do
    resources :comments
    resources :notifications
  end
  root "posts#index"
  post 'profile/:id/follow', to: 'profile#follow', as: 'follow'
  post 'profile/:id/unfollow', to: 'profile#unfollow', as: 'unfollow'
  post 'profile/:id/accept', to: 'profile#accept', as: 'accept'
  post 'profile/:id/decline', to: 'profile#decline', as: 'decline'
  post 'profile/:id/cancel', to: 'profile#cancel', as: 'cancel'
  get 'profile/:id', to: 'profile#show', as: 'profile'
  resources :likes, only: [:create, :destroy]
end
