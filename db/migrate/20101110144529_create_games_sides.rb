class CreateGamesSides < ActiveRecord::Migration
  def self.up
    create_table :games_sides, :id => false do |t|
      t.integer :game_id
      t.integer :side_id
    end
  end

  def self.down
    drop_table :games_sides
  end
end
