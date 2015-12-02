class Bank < ActiveRecord::Base
	has_many :transactions
	has_many :citizen_bank_data
end
