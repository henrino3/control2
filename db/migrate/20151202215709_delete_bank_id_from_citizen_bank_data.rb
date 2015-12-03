class DeleteBankIdFromCitizenBankData < ActiveRecord::Migration
  def change
  	remove_column :citizen_bank_data, :bank_id, :string
  end
end
