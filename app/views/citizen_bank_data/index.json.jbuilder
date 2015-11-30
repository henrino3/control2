json.array!(@citizen_bank_data) do |citizen_bank_datum|
  json.extract! citizen_bank_datum, :id, :national_id, :bank_id, :account_id, :citizen_id
  json.url citizen_bank_datum_url(citizen_bank_datum, format: :json)
end
