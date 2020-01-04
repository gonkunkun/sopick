# frozen_string_literal: true

class BrothelTypeSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id,
             :name,
             :type,
             :identifier
end
