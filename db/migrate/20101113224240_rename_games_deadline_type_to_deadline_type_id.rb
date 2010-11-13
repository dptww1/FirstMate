class RenameGamesDeadlineTypeToDeadlineTypeId < ActiveRecord::Migration
  def self.up
    rename_column :games, :deadline_type, :deadline_type_id
  end

  def self.down
  end
end
