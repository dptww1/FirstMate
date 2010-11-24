class Game < ActiveRecord::Base
  has_and_belongs_to_many :sides
  belongs_to :deadline_type
  has_many :users_games_roles
  has_many :users, :through => :users_games_roles

  validates :name,             :presence => true, :uniqueness => true
  validates :turn,             :presence => true, :numericality => true
  validates :deadline,         :presence => true
  validates :deadline_type_id, :presence => true
  validates :scenario_name,    :presence => true

  attr_accessible :name, :turn, :deadline, :deadline_type, :deadline_type_id, :scenario_name
  attr_accessible :users_games_roles

#  after_save :set_admin_user

  scope :active, where("")

  def self.active?
    where("deadline_type_id = 2 AND deadline >= ?", @deadline)
  end

  def set_admin_user
#    user_games_roles
  end
end
