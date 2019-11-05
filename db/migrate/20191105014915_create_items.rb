class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name
      t.string :desc
      t.float :price
      t.string :picture_url

      t.timestamps
    end
  end
end
