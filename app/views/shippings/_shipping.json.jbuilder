json.id shipping.id

json.shipping_method do
  json.id shipping.shipping_method.id
  json.name shipping.shipping_method.name
  json.price shipping.shipping_method.price
end

json.order do
  json.id shipping.order.id

  json.user do
    json.id shipping.order.user.id
    json.street shipping.order.user.first_name
    json.apartment shipping.order.user.last_name
    json.city shipping.order.user.email
    json.zipcode shipping.order.user.phone_number
  end

  json.payment do
    json.id shipping.order.payment.id
    json.total shipping.order.payment.total
  
    json.payment_method do
      json.id shipping.order.payment.payment_method.id 
      json.name shipping.order.payment.payment_method.name
    end
  end
end

json.address do
  json.id shipping.address.id
  json.street shipping.address.street
  json.apartment shipping.address.apartment
  json.city shipping.address.city
  json.zipcode shipping.address.zipcode
end

json.(shipping, :created_at, :updated_at)