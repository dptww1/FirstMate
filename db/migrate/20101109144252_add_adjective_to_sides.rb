class AddAdjectiveToSides < ActiveRecord::Migration
  def self.up
    add_column :sides, :adjective, :string
  end

  def self.down
    remove_column :sides, :adjective
  end
end
