# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users,
             path: '',
             path_names: {
               sign_in: 'login',
               sign_out: 'logout',
               registration: 'signup'
             },
             controllers: {
               sessions: 'sessions',
               registrations: 'registrations'
             }
  namespace :api, defaults: { format: :json }, path: '/' do
    namespace :v1, constraints: ApiVersionConstraint.new(version: 1, default: true), path: '/'do
      resources :savings
      resources :saving_transactions, only: [:index, :create, :update, :destroy]
      resources :savings_schedules
      resources :users, only: [:update]
    end
  end
end
