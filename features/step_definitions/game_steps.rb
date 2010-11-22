Given /^I have (?:a )?games? titled (\S+(?:,\s*\S+)*)$/ do |titles|
  titles.split(/\s*,\s*/).each do |title|
    Game.create!(:name => title, 
                 :scenario_name => "#{title} Scen",
                 :turn => 1, 
                 :deadline => Date.today, 
                 :deadline_type => DeadlineType.find(0)
                 )
  end
end
