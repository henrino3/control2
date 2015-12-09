class DropBanksTable < ActiveRecord::Migration
  def up
  	drop_table :banks
  end

  def down
  	raise ActiveRecord::IrreversibleMigration
  end
end
