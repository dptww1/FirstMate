class Scenario < ActiveRecord::Base
  has_many :games
  has_many :scenarios_sides
  has_many :sides, :through => :scenarios_sides
end
