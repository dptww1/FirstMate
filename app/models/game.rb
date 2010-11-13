class Game < ActiveRecord::Base
  has_and_belongs_to_many :sides
  belongs_to :deadline_type
  has_many :player_game_roles

  scope :active, where("")

  def self.active?
    where("deadline_type_id = 2 AND deadline >= ?", @deadline)
  end
end
