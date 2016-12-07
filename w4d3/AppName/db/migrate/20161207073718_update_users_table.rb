class UpdateUsersTable < ActiveRecord::Migration
  def change
    remove_column :users, :password
    change_column :users, :username, :string, null: false
    change_column :users, :password_digest, :string, null: false
    change_column :users, :session_token, :string, null: false
  end
end
