json.extract! order, :id, :customerid, :email, :itemid, :description, :award, :price, :total, :created_at, :updated_at
json.url order_url(order, format: :json)
