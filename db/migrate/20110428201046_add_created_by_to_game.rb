class AddCreatedByToGame < ActiveRecord::Migration
  def self.up
    add_column :games, :created_by, :integer
  end

  def self.down
    remove_column :games, :created_by
  end
end
