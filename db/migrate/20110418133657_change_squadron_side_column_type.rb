class ChangeSquadronSideColumnType < ActiveRecord::Migration
  def self.up
    remove_column :squadrons, :side_id
    add_column :squadrons, :side, :string
  end

  def self.down
    remove_column :squadrons, :side
    add_column :squadrons, :side_in, :integer
  end
end
