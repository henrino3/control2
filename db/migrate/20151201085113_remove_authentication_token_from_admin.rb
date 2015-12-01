class RemoveAuthenticationTokenFromAdmin < ActiveRecord::Migration
  def change
  	remove_column :admins, :authentication_token
  end
end
