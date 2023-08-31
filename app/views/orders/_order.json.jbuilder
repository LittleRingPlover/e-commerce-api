json.id order.id

json.user do
  json.id order.user.id
  json.street order.user.first_name
  json.apartment order.user.last_name
  json.city order.user.email
  json.zipcode order.user.phone_number
end

json.payment do
  json.id order.payment.id
  json.total order.payment.total

  json.payment_method do
    json.id order.payment.payment_method.id 
    json.name order.payment.payment_method.name
  end
end

json.(order, :created_at, :updated_at)