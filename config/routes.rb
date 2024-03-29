# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  resources :leagues, only: %i(index)
  resources :home, only: %i(index)
  root to: 'home#index'
  namespace :api, format: 'json' do
    resources :leagues, only: [:index]
    resources :teams, only: [:index]
    resources :favorites, only: [:index, :create]
    resources :competitors, only: [:index, :create]
    resources :standings, only: [:index, :show]
    resources :team_filter, only: [:index]
    resources :matches, only: [:index, :show]
    resources :update_matches, only: [:index]
    resources :update_standings, only: [:index]
  end
  get 'privacy_policy', to: 'home#privacy_policy', as: 'privacy_policy'
  get 'terms_of_service', to: 'home#terms_of_service', as: 'terms_of_service'
  get '*path', to: 'leagues#index'
end
