class Ship < ActiveRecord::Base
  has_many :scenarios_sides_ships
  has_many :scenarios, :through => :scenarios_sides_ships
end
