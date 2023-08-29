json.(@discounts) do |discount|

  json.id discount.id
  json.extract! discount, :title, :description, :discount_percent

end