class Citizen < ActiveRecord::Base
	has_many :citizen_bank_data
	has_many :transactions

	validates :name, presence: true
	validates :national_id, presence: true, format: {:with => /^[A-Z]{3}\d{10}$/, multiline: true, message: "must have 3 capital letters and 10 digits following"}
end
