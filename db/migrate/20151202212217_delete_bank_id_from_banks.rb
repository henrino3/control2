class DeleteBankIdFromBanks < ActiveRecord::Migration
  def change
  	remove_column :banks, :bank_id
  end
end
