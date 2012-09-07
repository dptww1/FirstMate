class CreateGameTemplates < ActiveRecord::Migration
  def self.up
    create_table :game_templates do |t|
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :game_templates
  end
end
