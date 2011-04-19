class SquadronsShip < ActiveRecord::Base
  belongs_to :squadron
  belongs_to :user
  has_many :ships

  attr_accessible :name, :user_id, :squadron_id
end
