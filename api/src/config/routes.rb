# frozen_string_literal: true

Rails.application.routes.draw do
  get "actors/index"
  get "actors/show"

  get "healthcheck", to: "samples#healthcheck"
  get "healthcheckWithAuth", to: "samples#healthcheckWithAuth"
end
