class CreateDeadlineTypes < ActiveRecord::Migration
  def self.up
    create_table :deadline_types do |t|
      t.string :name
    end
  end

  def self.down
    drop_table :deadline_types
  end
end
