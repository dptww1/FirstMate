class AddGameTemplateIdToGames < ActiveRecord::Migration
  def self.up
    add_column :games, :game_template_id, :integer
  end

  def self.down
    remove_column :games, :game_template_id
  end
end
