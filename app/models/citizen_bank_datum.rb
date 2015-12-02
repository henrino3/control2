class CitizenBankDatum < ActiveRecord::Base
  belongs_to :citizen
  belongs_to :banks
end
