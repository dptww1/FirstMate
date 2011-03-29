class AddSeqNumToSquadrons < ActiveRecord::Migration
  def self.up
    add_column :squadrons, :seq_num, :integer
  end

  def self.down
    remove_column :squadrons, :seq_num
  end
end
