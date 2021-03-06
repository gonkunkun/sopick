# frozen_string_literal: true

class CreateActors < ActiveRecord::Migration[6.0]
  def up
    create_table :actors do |t|
      # TODO: 外部キーを張る
      t.references :brothel, index: true

      t.string   :service_id
      t.string   :girl_id
      t.string   :name
      t.integer  :age
      t.integer  :tall
      t.integer  :bust
      t.string   :cup
      t.integer  :waist
      t.integer  :hip
      t.string   :actor_page_url
      t.boolean  :is_exist_diary, default: false
      t.boolean  :is_delete, default: false
      t.datetime "created_at", default: -> { "CURRENT_TIMESTAMP" }
      t.datetime "updated_at", default: -> { "CURRENT_TIMESTAMP" }
    end
    add_index :actors, [:name, :brothel_id], unique: true
  end

  def down
    drop_table :actors
  end
end
