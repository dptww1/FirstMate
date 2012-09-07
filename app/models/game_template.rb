class GameTemplate < ActiveRecord::Base
  has_many :games
  has_many :phases, :order => :seq_num
end
