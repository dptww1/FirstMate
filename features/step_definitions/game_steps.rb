def current_game
  Game.order("created_at DESC")[0]  # assumes most recent game was created by earlier clause in feature
end

# Given /^I have (?:a )?games? titled (\S+(?:,\s*\S+)*)$/ do |titles|
#   titles.split(/\s*,\s*/).each do |title|
#     Game.create!(:name => title, 
#                  :scenario_name => "#{title} Scen",
#                  :turn => 1, 
#                  :deadline => Time.gm(Date.today.year, 'Dec', 20, 14, 30),
#                  :deadline_type => DeadlineType.find(0)
#                  )
#   end
# end

Given /^I have a game titled "([^\"]*)" created by "([^\"]*)"$/ do |title, username|
  g = Game.new(:name => title,
               :scenario => Scenario.first,
               :turn => 1,
               :deadline => Time.gm(2010, 'Dec', 20, 14, 30),
               :deadline_type => DeadlineType.find(0),
               :side1 => "Side1",
               :side2 => "Side2"
               )
  [g.side1, g.side2].each do |side_name|
    g.squadrons << Squadron.new(:seq_num => 0, :name => "Fleet", :side => side_name)
  end
  g.save
end

Given /^I create the following games?:$/ do |table|
  table.hashes.each_with_index do |h, i|
    Game.create!(
                 :name => h['name'] || "Game #{i}",
                 :scenario => h['scenario'] ? Scenario.find_by_name(h['scenario']) : Scenario.first,
                 :turn => h['turn'] || 1,
                 :deadline => Time.gm(2010, 'Dec', 20, 14, 30),
                 :deadline_type => DeadlineType.find(0),
                 :side1 => "Side1",
                 :side2 => "Side2"
                 )
  end
end

# Given /^the orders deadline for "([^\"]+)" is (\d+) days? (away|expired)$/ do |game_name, ndays, dir|
#   ndays = ndays.to_i
#   ndays = -ndays if dir == "expired"

#   g = Game.where("name = ?", game_name).first()
#   g.update_attribute(:deadline, Date.today + ndays)
# end

Given /^"([^\"]+)" is (Captain|Admiral) of "([^\"]+)" on (Side\d)$/ do |name, role, ship, side|
  u = User.create!(:username => name, 
                   :password => "xxx", 
                   :password_confirmation => "xxx", 
                   :email => "townsend@patriot.net", 
                   :timezone => "Indiana (East)")
  sq = current_game.squadrons_by_side(side)[0]
  sq.squadrons_ships << SquadronsShip.new(:name => ship, :user_id => u.id)
end

Given /^the current turn is (\d+)$/ do |turn|
  current_game.update_attribute(:turn, turn)
end

Given /^"([^\"]+)" entered orders "([^\"]+)" for "([^\"]+)" on turn (\d+)$/ do |user, orders, ship, turn|
  user = User.where(:username => user).first
  throw "NoSuchUser#{user}" if user.nil?

  current_game.squadrons.each do |sq|
    sq.squadrons_ships.each do |ss|
      if ss.name == ship
        o = Order.new(:squadrons_ship_id => ss.id, :order_text => orders, :user_id => user.id, :turn => turn)
        o.save
      end
    end
  end
end
