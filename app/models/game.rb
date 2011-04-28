class Game < ActiveRecord::Base
  belongs_to :deadline_type
  has_many :users_games_roles
  has_many :users, :through => :users_games_roles
  has_many :squadrons
 
  validates :name,             :presence => true, :uniqueness => true
  validates :turn,             :presence => true, :numericality => true
  validates :deadline,         :presence => true
  validates :deadline_type_id, :presence => true

  attr_accessible :name, :turn, :deadline, :deadline_type
  attr_accessible :deadline_type_id
  attr_accessible :users_games_roles
  attr_accessible :side1, :side2
  attr_accessible :squadrons

  scope :active, where("")

  def participant?(user_id)    # TODO: CinC, Admiral
    status = false

    squadrons.each do |sq|
      sq.squadrons_ships.each do |ss|
        status = true if ss.user_id == user_id
      end
    end

    status
  end

  def user_is_role(user, role_id)
    users_games_roles.detect { |ugr| ugr.user_id == user.id && ugr.role_id == role_id } if user
  end

  def squadrons_by_side(side)
    squadrons.find_all { |s| s.side == side }.sort { |a,b| a.seq_num <=> b.seq_num }
  end
end
