class CreateSquadronsShips < ActiveRecord::Migration
  def self.up
    create_table :squadrons_ships do |t|
      t.integer :squadron_id
      t.string :name
      t.integer :user_id

      t.timestamps
    end
  end

  def self.down
    drop_table :squadrons_ships
  end
end
