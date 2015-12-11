class CitizenBankDatum < ActiveRecord::Base
  belongs_to :citizen
  belongs_to :bank

  validates :account_id, uniqueness: :true
end
