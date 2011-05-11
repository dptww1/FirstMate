class AddCinCsToGame < ActiveRecord::Migration
  def self.up
    add_column :games, :side1_cinc, :integer
    add_column :games, :side2_cinc, :integer
  end

  def self.down
    remove_column :games, :side2_cinc
    remove_column :games, :side1_cinc
  end
end
