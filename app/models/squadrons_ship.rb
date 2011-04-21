class SquadronsShip < ActiveRecord::Base
  belongs_to :squadron
  belongs_to :user
  has_many :ships
  has_many :orders

  attr_accessible :name, :user_id, :squadron_id, :orders

  def find_turn_orders(turn)
    orders.detect { |o| o.turn == turn }
  end
end
