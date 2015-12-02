class AddCitizenBankDataToBank < ActiveRecord::Migration
  def change
    add_reference :banks, :bank, index: true, foreign_key: true
  end
end
