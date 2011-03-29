class Squadron < ActiveRecord::Base
  has_many :games, :through => :games_sides_squadrons
end
