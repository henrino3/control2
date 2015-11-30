class DropBankTable < ActiveRecord::Migration
  def change
  	drop_table :banks
  end
end
