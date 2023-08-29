json.(@products) do |product|

  json.id product.id
  json.extract! product, :title, :description, :price

  json.category do
    json.id product.category.id
    json.title product.category.title
  end
  
  if product.discount.nil?
    json.discount nil
  else
    json.discount do
      json.id product.discount.id
      json.title product.discount.title
      json.description product.discount.description
      json.discount_percent product.discount.discount_percent
    end
  end

  json.(product, :created_at, :updated_at)
end
