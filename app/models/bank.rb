class Bank < ActiveRecord::Base
	has_many :transactions
end
