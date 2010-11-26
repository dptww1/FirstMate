class AddScenarioToGame < ActiveRecord::Migration
  def self.up
    add_column :games, :scenario_id, :integer
    remove_column :games, :scenario_name
  end

  def self.down
    add_column :games, :scenario_name, :string
    remove_column :games, :scenario_id
  end
end
