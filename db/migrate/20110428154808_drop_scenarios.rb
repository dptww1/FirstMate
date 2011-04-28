class DropScenarios < ActiveRecord::Migration
  def self.up
    drop_table :scenarios_sides_ships
    drop_table :scenarios_sides
    drop_table :scenarios
    remove_columns :games, :scenario_id
  end

  def self.down
  end
end
