json.extract! receipt, :id, :user_id, :status, :user_email, :amount, :payer_id, :pay_source, :pay_source_status, :data, :created_at, :updated_at
json.url receipt_url(receipt, format: :json)
