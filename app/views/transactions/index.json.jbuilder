json.array!(@transactions) do |transaction|
  json.extract! transaction, :id, :transaction_name, :transaction_amount, :account_balance, :bank_id, :citizen_id
  json.url transaction_url(transaction, format: :json)
end
