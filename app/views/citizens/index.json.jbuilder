json.array!(@citizens) do |citizen|
  json.extract! citizen, :id, :name, :phone_num, :email, :address, :national_id
  json.url citizen_url(citizen, format: :json)
end
