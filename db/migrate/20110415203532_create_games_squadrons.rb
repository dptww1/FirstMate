class CreateGamesSquadrons < ActiveRecord::Migration
  def self.up
    create_table :games_squadrons do |t|
      t.integer :game_id
      t.integer :squadron_id
      t.string :side

      t.timestamps
    end
  end

  def self.down
    drop_table :games_squadrons
  end
end
