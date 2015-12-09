class AddColumnsToAdmin < ActiveRecord::Migration
  def change
    add_column :admins, :name, :string
    add_column :admins, :level, :string
    add_column :admins, :security_question, :string
    add_column :admins, :security_answer, :string
    add_column :admins, :phone, :string
  end
end
