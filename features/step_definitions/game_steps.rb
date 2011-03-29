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

Given /^I have a game titled "([^"]*)" created by "([^"]*)"$/ do |title, username|
  Game.create!(:name => title,
               :scenario => Scenario.first(),
               :turn => 1,
               :deadline => Time.gm(2010, 'Dec', 20, 14, 30),
               :deadline_type => DeadlineType.find(0)
              )
end

Given /^I create the following games?:$/ do |table|
  table.hashes.each_with_index do |h, i|
    Game.create!(
                 :name => h['name'] || "Game #{i}",
                 :scenario => h['scenario'] ? Scenario.find_by_name(h['scenario']) : Scenario.first(),
                 :turn => h['turn'] || 1,
                 :deadline => Time.gm(2010, 'Dec', 20, 14, 30),
                 :deadline_type => DeadlineType.find(0)
                 )
  end
end
