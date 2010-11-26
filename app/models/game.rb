class Game < ActiveRecord::Base
  has_and_belongs_to_many :sides
  belongs_to :deadline_type
  has_many :users_games_roles
  has_many :users, :through => :users_games_roles
  belongs_to :scenario

  validates :name,             :presence => true, :uniqueness => true
  validates :turn,             :presence => true, :numericality => true
  validates :deadline,         :presence => true
  validates :deadline_type_id, :presence => true
  validates :scenario_id,      :presence => true

  attr_accessible :name, :turn, :deadline, :deadline_type, :scenario
  attr_accessible :deadline_type_id, :scenario_id
  attr_accessible :users_games_roles

  scope :active, where("")

  def self.active?
    where("deadline_type_id = 2 AND deadline >= ?", @deadline)
  end

  def user_is_role(user, role_id)
    users_games_roles.detect { |ugr| ugr.user_id = user.id && ugr.role_id = role_id }
  end
end
