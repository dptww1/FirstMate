class CreatePhases < ActiveRecord::Migration
  def self.up
    create_table :phases do |t|
      t.integer :game_template_id
      t.string :name
      t.string :template
      t.string :permissions
      t.integer :seq_num

      t.timestamps
    end
  end

  def self.down
    drop_table :phases
  end
end
