# frozen_string_literal: true

Rails.application.routes.draw do
  resources :actors, only: [:index, :show]
  resources :brothel_types, only: [:index]
  resources :prefectures, only: [:index]

  get "healthcheck", to: "samples#healthcheck"
end
