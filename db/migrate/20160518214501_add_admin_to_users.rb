class AddAdminToUsers < ActiveRecord::Migration
  def change
    #false for every user by default
    add_column :users, :admin, :boolean, default: false
  end
end
