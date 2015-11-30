class CreateCitizenBankData < ActiveRecord::Migration
  def change
    create_table :citizen_bank_data do |t|
      t.string :national_id
      t.string :bank_id
      t.string :account_id
      t.references :citizen, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
