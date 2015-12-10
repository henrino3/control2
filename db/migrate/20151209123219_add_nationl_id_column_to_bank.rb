class AddNationlIdColumnToBank < ActiveRecord::Migration
  def change
    add_column :banks, :national_id, :string
  end
end
