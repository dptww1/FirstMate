class ScenariosSidesShip < ActiveRecord::Base
  belongs_to :scenario
  belongs_to :ship
end
