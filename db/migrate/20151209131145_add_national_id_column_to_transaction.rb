class AddNationalIdColumnToTransaction < ActiveRecord::Migration
  def change
  	add_column :transactions, :national_id, :string
  end
end
