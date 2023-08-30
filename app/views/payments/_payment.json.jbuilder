json.id payment.id
json.extract! payment, :total

json.payment_method do
  json.id payment.payment_method.id
  json.title payment.payment_method.name
end

json.(payment, :created_at, :updated_at)