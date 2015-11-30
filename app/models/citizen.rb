class Citizen < ActiveRecord::Base
	has_many :citizen_bank_data
	has_many :transactions
end
