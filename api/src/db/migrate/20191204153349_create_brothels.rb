class CreateBrothels < ActiveRecord::Migration[6.0]
  def change
    create_table :brothels do |t|
      t.string   :brothel_name
      t.string   :brothel_url
      t.string   :prefecture
      t.boolean  :is_delete
      t.timestamps
    end
  end
end
