class Role < ActiveRecord::Base
  # These must correspond with the Roles table!
  CAPTAIN    = 0
  ADMIRAL    = 1
  CINC       = 2
  GAME_ADMIN = 3

  has_many :users_games_roles
end
