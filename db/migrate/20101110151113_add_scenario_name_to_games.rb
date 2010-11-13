class AddScenarioNameToGames < ActiveRecord::Migration
  def self.up
    add_column :games, :scenario_name, :string
  end

  def self.down
    remove_column :games, :scenario_name
  end
end
