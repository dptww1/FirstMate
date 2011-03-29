class GamesSidesSquadron < ActiveRecord::Base
  belongs_to :game
  belongs_to :squadron
end
