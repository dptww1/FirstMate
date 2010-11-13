class CreatePlayerGameRoles < ActiveRecord::Migration
  def self.up
    create_table :player_game_roles do |t|
      t.integer :game_id
      t.integer :player_id
      t.integer :role_id
      t.integer :side_id

      t.timestamps
    end
  end

  def self.down
    drop_table :player_game_roles
  end
end
