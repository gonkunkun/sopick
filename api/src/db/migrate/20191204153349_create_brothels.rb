class CreateBrothels < ActiveRecord::Migration[6.0]
  def change
    create_table :brothels do |t|
      t.string   :brothel_name
      t.string   :brothel_url
      t.string   :prefecture
      t.boolean  :is_delete, default: false
      t.datetime "created_at", default: -> { "CURRENT_TIMESTAMP" }
      t.datetime "updated_at", default: -> { "CURRENT_TIMESTAMP" }
    end
  end
end
