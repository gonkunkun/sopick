# frozen_string_literal: true

class PrefecturesController < ApplicationController
  def index
    prefectures = Prefecture.find(:all)
    render json: prefectures
  end
end
