json.extract! address, :id, :street, :apartment, :city, :zipcode, :created_at, :updated_at
json.url address_url(address, format: :json)
