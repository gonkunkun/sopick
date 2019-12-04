class CreateActorImages < ActiveRecord::Migration[6.0]
  def change
    create_table :actor_images do |t|
      t.string   :image_url
      t.string   :image_path
      t.datetime "created_at", default: -> { "CURRENT_TIMESTAMP" }
      t.datetime "updated_at", default: -> { "CURRENT_TIMESTAMP" }

      t.references :actor, foreign_key: true
    end
  end
end
