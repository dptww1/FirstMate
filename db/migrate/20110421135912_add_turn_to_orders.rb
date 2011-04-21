class AddTurnToOrders < ActiveRecord::Migration
  def self.up
    add_column :orders, :turn, :integer
  end

  def self.down
    remove_column :orders, :turn
  end
end
