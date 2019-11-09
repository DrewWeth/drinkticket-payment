class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name
      t.string :desc
      t.float :price
      t.string :picture_url
      t.integer :group_id
      t.integer :changed_by_user_id
      t.boolean :listed
      t.boolean :hidden
      t.timestamps
    end
  end
end
