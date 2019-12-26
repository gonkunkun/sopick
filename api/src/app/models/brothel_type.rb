# frozen_string_literal: true

class BrothelType < ActiveHash::Base
  self.data = [
      { id: 1, name: "ヘルス",        type: "HEALTH",      identifier: "biz1" },
      { id: 2, name: "ソープ",        type: "SOAP",        identifier: "biz4" },
      { id: 3, name: "ホテヘル",      type: "HOTE_HEALTH", identifier: "biz5" },
      { id: 4, name: "デリヘル",      type: "DELI_HEALTH", identifier: "biz6" },
      { id: 5, name: "エステ・アロマ", type: "ESTE_AROMA",  identifier: "biz7" }
    ]
end
