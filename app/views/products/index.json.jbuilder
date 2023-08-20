json.(@products) do |product|

  json.id product.id
  json.extract! product, :title, :description, :price

  json.category do
      json.id product.category.id
      json.title product.category.title
  end
  
  json.(product, :created_at, :updated_at)
end
