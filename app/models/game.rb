class Game < ActiveRecord::Base
  has_and_belongs_to_many :sides
  belongs_to :deadline_type
  has_many :users_games_roles
  has_many :users, :through => :users_games_roles

  scope :active, where("")

  def self.active?
    where("deadline_type_id = 2 AND deadline >= ?", @deadline)
  end
end
