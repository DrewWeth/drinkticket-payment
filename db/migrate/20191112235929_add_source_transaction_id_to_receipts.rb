class AddSourceTransactionIdToReceipts < ActiveRecord::Migration[6.0]
  def change
    add_column :receipts, :source_transaction_id, :string
  end
end
