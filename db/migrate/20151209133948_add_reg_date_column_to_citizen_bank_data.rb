class AddRegDateColumnToCitizenBankData < ActiveRecord::Migration
  def change
     add_column :citizen_bank_data , :reg_date , :string
  end
end
