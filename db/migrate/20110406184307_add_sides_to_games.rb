class AddSidesToGames < ActiveRecord::Migration
  def self.up
    add_column :games, :side1, :string
    add_column :games, :side2, :string
  end

  def self.down
    remove_column :games, :side2
    remove_column :games, :side1
  end
end
