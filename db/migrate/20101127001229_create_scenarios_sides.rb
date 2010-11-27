class CreateScenariosSides < ActiveRecord::Migration
  def self.up
    create_table :scenarios_sides, :id => false do |t|
      t.integer :scenario_id
      t.integer :side_id
    end
  end

  def self.down
    drop_table :scenarios_sides
  end
end
