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
        status = true if ss.user_id == user_id  # any ship captain is a participant
      end
    end

    status
  end

  def squadrons_by_side(side)
    squadrons.find_all { |s| s.side == side }.sort { |a,b| a.seq_num <=> b.seq_num }
  end

  def self.find_progress_counts
    connection.select_all(<<END_QUERY
SELECT 
  g.id, 
  COALESCE(s1_num_ships.cnt,  0) AS s1_num_ships_cnt,
  COALESCE(s1_cur_orders.cnt, 0) AS s1_cur_orders_cnt,
  COALESCE(s2_num_ships.cnt,  0) AS s2_num_ships_cnt,
  COALESCE(s2_cur_orders.cnt, 0) AS s2_cur_orders_cnt
FROM games g
LEFT OUTER JOIN (
    SELECT g.id, COUNT(*) AS cnt
    FROM games g
    INNER JOIN squadrons       sq ON sq.game_id     = g.id
    INNER JOIN squadrons_ships ss ON ss.squadron_id = sq.id
    WHERE sq.side = g.side1
    GROUP BY g.id
  ) s1_num_ships ON g.id = s1_num_ships.id 
LEFT OUTER JOIN (
    SELECT g.id, COUNT(*) AS cnt
    FROM games g
    INNER JOIN squadrons       sq ON sq.game_id          = g.id
    INNER JOIN squadrons_ships ss ON ss.squadron_id      = sq.id
    INNER JOIN orders          o  ON o.squadrons_ship_id = ss.id
    WHERE o.turn = g.turn AND sq.side = g.side1
    GROUP BY g.id
  ) s1_cur_orders ON g.id = s1_cur_orders.id
LEFT OUTER JOIN (
    SELECT g.id, COUNT(*) AS cnt
    FROM games g
    INNER JOIN squadrons       sq ON sq.game_id     = g.id
    INNER JOIN squadrons_ships ss ON ss.squadron_id = sq.id
    WHERE sq.side = g.side2
    GROUP BY g.id
  ) s2_num_ships ON g.id = s2_num_ships.id 
LEFT OUTER JOIN (
    SELECT g.id, COUNT(*) AS cnt
    FROM games g
    INNER JOIN squadrons       sq ON sq.game_id          = g.id
    INNER JOIN squadrons_ships ss ON ss.squadron_id      = sq.id
    INNER JOIN orders          o  ON o.squadrons_ship_id = ss.id
    WHERE o.turn = g.turn AND sq.side = g.side2
    GROUP BY g.id
  ) s2_cur_orders ON g.id = s2_cur_orders.id
END_QUERY
      ).inject({}) do |h,k|
      h[k["id"].to_i] = k.inject({}) { |h2,val| h2[val[0].to_sym] = val[1].to_i; h2 }
      h
    end
  end

private
  def create_squadrons
    [side1, side2].each do |side_name|
      squadrons << Squadron.new(:seq_num => 0, :name => "Fleet", :side => side_name)
    end
  end
end
