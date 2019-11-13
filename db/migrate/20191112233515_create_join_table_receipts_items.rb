class CreateJoinTableReceiptsItems < ActiveRecord::Migration[6.0]
  def change
    create_join_table :receipts, :items do |t|
      # t.index [:receipt_id, :item_id]
      # t.index [:item_id, :receipt_id]
    end
  end
end
