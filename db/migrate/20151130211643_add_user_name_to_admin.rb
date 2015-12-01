class AddUserNameToAdmin < ActiveRecord::Migration
  def change
    add_column :admins, :username, :string, null: false, default: "", after: :email
  end
end
