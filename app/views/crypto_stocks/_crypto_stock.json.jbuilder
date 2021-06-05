json.extract! crypto_stock, :id, :symbol, :cost_per, :amount_owned, :user_id, :created_at, :updated_at
json.url crypto_stock_url(crypto_stock, format: :json)
