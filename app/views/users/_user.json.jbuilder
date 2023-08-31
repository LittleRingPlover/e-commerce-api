json.id user.id
json.extract! user, :first_name, :last_name, :encrypted_password, :email, :phone_number

json.address do
  json.id user.address.id
  json.street user.address.street
  json.apartment user.address.apartment
  json.city user.address.city
  json.zipcode user.address.zipcode
end

json.(user, :created_at, :updated_at)