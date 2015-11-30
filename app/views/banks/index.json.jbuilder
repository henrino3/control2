json.array!(@banks) do |bank|
  json.extract! bank, :id, :name, :bank_type, :registration_no, :founded_data, :main_service, :bank_email, :bank_website, :bank_logo_url, :token
  json.url bank_url(bank, format: :json)
end
