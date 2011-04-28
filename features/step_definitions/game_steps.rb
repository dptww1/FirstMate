def current_game
  Game.order("created_at DESC")[0]  # assumes most recent game was created by earlier clause in feature
end

# Given /^I have (?:a )?games? titled (\S+(?:,\s*\S+)*)$/ do |titles|
#   titles.split(/\s*,\s*/).each do |title|
#     Game.create!(:name => title, 
#                  :turn => 1, 
#                  :deadline => Time.gm(Date.today.year, 'Dec', 20, 14, 30),
#                  :deadline_type => DeadlineType.find(0)
#                  )
#   end
# end

Given /^I have a game titled "([^\"]*)" created by "([^\"]*)"$/ do |title, username|
  u = find_or_create(username)

  g = Game.new(:name => title,
               :turn => 1,
               :deadline => Time.gm(2010, 'Dec', 20, 14, 30),
               :deadline_type => DeadlineType.find(0),
               :side1 => "Side1",
               :side2 => "Side2"
               )

  [g.side1, g.side2].each do |side_name|
    g.squadrons << Squadron.new(:seq_num => 0, :name => "Fleet", :side => side_name)
  end

  g.users_games_roles << UsersGamesRole.new(:user_id => u.id, :role_id => Role::GAME_ADMIN)

  g.save
end

Given /^I create the following games?:$/ do |table|
  table.hashes.each_with_index do |h, i|
    Game.create!(
                 :name => h['name'] || "Game #{i}",
                 :turn => h['turn'] || 1,
                 :deadline => Time.gm(2010, 'Dec', 20, 14, 30),
                 :deadline_type => DeadlineType.find(0),
                 :side1 => "Side1",
                 :side2 => "Side2"
                 )
  end
end

Given /^"([^\"]+)" is (Captain|Admiral) of "([^\"]+)" on (Side\d)$/ do |name, role, ship, side|
  u = find_or_create(name)

  sq = current_game.squadrons_by_side(side)[0]
  sq.squadrons_ships << SquadronsShip.new(:name => ship, :user_id => u.id)
end

Given /^the current turn is (\d+)$/ do |turn|
  current_game.update_attribute(:turn, turn)
end

Given /^"([^\"]+)" entered orders "([^\"]+)" for "([^\"]+)" on turn (\d+)$/ do |username, orders, ship, turn|
  user = User.where(:username => username).first
  throw "NoSuchUser#{username}" if user.nil?

  current_game.squadrons.each do |sq|
    sq.squadrons_ships.each do |ss|
      if ss.name == ship
        o = Order.create!(:squadrons_ship_id => ss.id, :order_text => orders, :user_id => user.id, :turn => turn)
      end
    end
  end
end
