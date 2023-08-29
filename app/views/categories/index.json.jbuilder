json.(@categories) do |category|

  json.id category.id
  json.extract! category, :title

end