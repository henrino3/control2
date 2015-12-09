class CreateBanks < ActiveRecord::Migration
  def change
    change_table :banks do |t|
      t.string :name
      t.string :bank_type
      t.string :registration_no
      t.string :founded_data
      t.string :main_service
      t.string :bank_website
      t.string :bank_logo_url
      t.string :token

      t.timestamps null: false
    end
  end
end
