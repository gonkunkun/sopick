# frozen_string_literal: true

class BrothelTypesController < ApplicationController
  def index
    brothelTypes = BrothelType.find(:all)
    # render json: BrothelTypeSerializer.new(BrothelType.first).serialized_json
    render json: brothelTypes
  end
end
