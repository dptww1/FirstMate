class UpdateUsersUniqueFieldFromEmailToUsername < ActiveRecord::Migration
  def self.up
    remove_index :users, :email
    add_index    :users, :username, :unique => true
  end

  def self.down
    remove_index :users, :username
    add_index    :users, :email, :unique => true
  end
end
