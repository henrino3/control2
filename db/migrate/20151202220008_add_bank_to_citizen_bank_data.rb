class AddBankToCitizenBankData < ActiveRecord::Migration
  def change
    add_reference :citizen_bank_data, :bank, index: true, foreign_key: true, after: :citizen_id
  end
end
