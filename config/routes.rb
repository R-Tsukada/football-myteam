# frozen_string_literal: true

Rails.application.routes.draw do
  resources :home
  get 'privacy_policy', to: 'home#privacy_policy', as: 'privacy_policy'
  devise_for :users
  root to: 'leagues#index'
  namespace :api, format: 'json' do
    resources :leagues, only: [:index]
    resources :teams, only: [:index]
    resources :favorites, only: [:index, :create]
    resources :competitors, only: [:index, :create]
    resources :standings, only: [:index, :show]
    resources :team_filter, only: [:index]
    resources :favorite_team_matches, only: [:index, :show]
    resources :first_competitor_team_matches, only: [:index]
    resources :secound_competitor_team_matches, only: [:index]
    resources :third_competitor_team_matches, only: [:index]
  end
end
