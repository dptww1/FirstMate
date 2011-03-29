class CreateSquadrons < ActiveRecord::Migration
  def self.up
    create_table :squadrons do |t|
      t.integer :game_id
      t.integer :side_id
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :squadrons
  end
end
