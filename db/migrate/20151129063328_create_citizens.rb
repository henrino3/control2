class CreateCitizens < ActiveRecord::Migration
  def change
    create_table :citizens do |t|
      t.string :name
      t.string :phone_num
      t.string :email
      t.string :address
      t.string :national_id

      t.timestamps null: false
    end
  end
end
