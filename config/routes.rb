# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  root to: 'leagues#index'
  namespace :api, format: 'json' do
    resources :leagues, only: [:index]
    resources :teams, only: [:index]
    resources :favorites, only: [:index, :create]
    resources :competitors, only: [:index, :create]
  end
end
