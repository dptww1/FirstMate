class CreateScenariosSidesShips < ActiveRecord::Migration
  def self.up
    create_table :scenarios_sides_ships, :id => false do |t|
      t.integer :scenario_id
      t.integer :side_id
      t.integer :ship_id
    end
  end

  def self.down
    drop_table :scenarios_sides_ships
  end
end
