# frozen_string_literal: true

class BrothelTypesController < ApplicationController
  def index
    brothelTypes = BrothelType.find(:all)
    render json: brothelTypes
  end
end
