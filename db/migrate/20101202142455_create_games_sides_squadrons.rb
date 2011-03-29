class CreateGamesSidesSquadrons < ActiveRecord::Migration
  def self.up
    create_table :games_sides_squadrons do |t|
      t.integer :game_id
      t.integer :side_id
      t.integer :squadron_id

      t.timestamps
    end
  end

  def self.down
    drop_table :games_sides_squadrons
  end
end
