class CreateTransactions < ActiveRecord::Migration[6.0]
  def change
    create_table :transactions do |t|
      t.integer :user_id
      t.string :status
      t.string :user_email
      t.float :amount
      t.string :payer_id
      t.string :pay_source
      t.string :pay_source_status
      t.json :data

      t.timestamps
    end
  end
end
