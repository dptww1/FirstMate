class AddUserIdToSquadron < ActiveRecord::Migration
  def self.up
    add_column :squadrons, :user_id, :integer
  end

  def self.down
    remove_column :squadrons, :user_id
  end
end
