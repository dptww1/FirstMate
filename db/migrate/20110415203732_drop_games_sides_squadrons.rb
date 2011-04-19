class DropGamesSidesSquadrons < ActiveRecord::Migration
  def self.up
    drop_table :games_sides_squadrons
  end

  def self.down
  end
end
