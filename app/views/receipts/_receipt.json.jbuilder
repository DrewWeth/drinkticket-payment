json.extract! receipt, :id, :source_created_at, :source_id, :payer, :payer_id, :pay_amount, :data, :created_at, :updated_at
json.url receipt_url(receipt, format: :json)
