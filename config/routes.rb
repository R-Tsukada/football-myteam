# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  get 'leagues', to: 'leagues#index', as: 'leagues'
  resources :home
  root to: 'home#index'
  namespace :api, format: 'json' do
    resources :leagues, only: [:index]
    resources :teams, only: [:index]
    resources :favorites, only: [:index, :create]
    resources :competitors, only: [:index, :create]
    resources :standings, only: [:index, :show]
    resources :team_filter, only: [:index]
    resources :matches, only: [:index, :show]
  end
  resources :home, only: %i(index)
  get 'privacy_policy', to: 'home#privacy_policy', as: 'privacy_policy'
  get 'terms_of_service', to: 'home#terms_of_service', as: 'terms_of_service'
  get '*path', to: 'leagues#index'
end
