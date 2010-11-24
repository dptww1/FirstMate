class Role < ActiveRecord::Base
  has_many :users_games_roles
end
