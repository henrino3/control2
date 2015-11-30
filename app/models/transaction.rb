class Transaction < ActiveRecord::Base
  belongs_to :bank
  belongs_to :citizen
end
