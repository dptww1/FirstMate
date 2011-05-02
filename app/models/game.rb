class Game < ActiveRecord::Base
  belongs_to :deadline_type
  has_many :squadrons

  before_create :create_squadrons
 
  validates :name,             :presence => true, :uniqueness => true
  validates :turn,             :presence => true, :numericality => true
  validates :deadline,         :presence => true
  validates :deadline_type_id, :presence => true
  validates :created_by,       :presence => true, :numericality => true
  validates :side1,            :presence => true
  validates :side2,            :presence => true

  attr_accessible :name, :turn, :deadline, :deadline_type
  attr_accessible :deadline_type_id
  attr_accessible :users_games_roles
  attr_accessible :side1, :side2
  attr_accessible :squadrons
  attr_accessible :created_by

  def participant?(user_id)    # TODO: Admirals
    status = created_by == user_id   # game creator is always a participant, even if not playing

    squadrons.each do |sq|
      sq.squadrons_ships.each do |ss|
        status = true if ss.user_id == user_id
      end
    end

    status
  end

  def squadrons_by_side(side)
    squadrons.find_all { |s| s.side == side }.sort { |a,b| a.seq_num <=> b.seq_num }
  end

private
  def create_squadrons
    [side1, side2].each do |side_name|
      squadrons << Squadron.new(:seq_num => 0, :name => "Fleet", :side => side_name)
    end
  end
end
