class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.string :transaction_name
      t.float :transaction_amount
      t.float :account_balance
      t.references :bank, index: true, foreign_key: true
      t.references :citizen, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
