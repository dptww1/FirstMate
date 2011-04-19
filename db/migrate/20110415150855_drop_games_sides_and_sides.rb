class DropGamesSidesAndSides < ActiveRecord::Migration
  def self.up
    drop_table :games_sides
    drop_table :sides
  end

  def self.down
  end
end
