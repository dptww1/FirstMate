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
               :deadline => Time.gm(Date.today.year, 'Dec', 20, 14, 30),
               :deadline_type => DeadlineType.find(0)
              )
end
