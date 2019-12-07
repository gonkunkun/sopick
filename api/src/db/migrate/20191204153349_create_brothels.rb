class CreateBrothels < ActiveRecord::Migration[6.0]
  def change
    create_table :brothels do |t|
      t.string   :brothel_name
      t.string   :brothel_name_en
      t.string   :brothel_url
      t.string   :prefecture
      t.string   :prefecture_en
      t.string   :area_id
      t.string   :area_detail_id
      t.string   :brothel_type_id
      t.string   :brothel_type_name
      t.boolean  :is_delete, default: false
      t.datetime "created_at", default: -> { "CURRENT_TIMESTAMP" }
      t.datetime "updated_at", default: -> { "CURRENT_TIMESTAMP" }
    end

    add_index :brothels, [:brothel_name, :prefecture], unique: true
  end

  def down
    drop_table :brothels
  end
end
