json.extract! item, :id, :name, :desc, :price, :picture_url, :created_at, :updated_at
json.url item_url(item, format: :json)
