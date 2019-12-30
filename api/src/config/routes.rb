# frozen_string_literal: true

Rails.application.routes.draw do
  resources :actors, only: [:index, :show]

  get "healthcheck", to: "samples#healthcheck"
  get "healthcheckWithAuth", to: "samples#healthcheckWithAuth"
end
