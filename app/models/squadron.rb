class Squadron < ActiveRecord::Base
  belongs_to :user
  belongs_to :game
  has_many   :squadrons_ships

  attr_accessible :name, :squadrons_ships, :seq_num, :side
end
