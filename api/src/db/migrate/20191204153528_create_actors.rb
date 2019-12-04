class CreateActors < ActiveRecord::Migration[6.0]
  def change
    create_table :actors do |t|
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
      t.timestamps

      t.references :brothel, foreign_key: true
    end
  end
end
