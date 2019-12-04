class CreateActorImages < ActiveRecord::Migration[6.0]
  def change
    create_table :actor_images do |t|
      t.string   :image_url
      t.string   :image_path
      t.timestamps

      t.references :actor, foreign_key: true
    end
  end
end
