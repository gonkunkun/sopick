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
      t.string   :bust
      t.integer  :waist
      t.string   :hip
      t.string   :actor_page_url
      t.boolean  :is_delete
      t.datetime "created_at", default: -> { "CURRENT_TIMESTAMP" }
      t.datetime "updated_at", default: -> { "CURRENT_TIMESTAMP" }
    end
    add_index :actors, [:name, :brothel_id], unique: true
  end

  def down
    drop_table :actors
  end
end
