class DropGamesSquadrons < ActiveRecord::Migration
  def self.up
    drop_table :games_squadrons
  end

  def self.down
  end
end
