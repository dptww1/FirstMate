class Side < ActiveRecord::Base
  # These must correspond with the Sides table!
  BRITAIN     = 0
  SPAIN       = 1
  US          = 2
  FRANCE      = 3
  NETHERLANDS = 4
  DENMARK     = 5
  ALLIES      = 6

  has_many :scenarios, :through => :scenarios_sides
  has_many :games,     :through => :games_sides
end
