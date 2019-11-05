class CreateReceipts < ActiveRecord::Migration[6.0]
  def change
    create_table :receipts do |t|
      t.timestamp :source_created_at
      t.integer :source_id
      t.string :payer
      t.string :payer_id
      t.float :pay_amount
      t.json :data

      t.timestamps
    end
  end
end
