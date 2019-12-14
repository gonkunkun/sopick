# frozen_string_literal: true

class CreateActorImages < ActiveRecord::Migration[6.0]
  def up
    create_table :actor_images do |t|
      # TODO: 外部キーを張る
      t.references :actor, index: true

      t.string   :image_path
      t.datetime "created_at", default: -> { "CURRENT_TIMESTAMP" }
      t.datetime "updated_at", default: -> { "CURRENT_TIMESTAMP" }
    end

    add_index :actor_images, [:actor_id, :image_path], unique: true
  end

  def down
    drop_table :actor_images
  end
end
