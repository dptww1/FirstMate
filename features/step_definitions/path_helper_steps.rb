When /^I visit (\S+_path)$/ do |path|
  visit path
end

When /^I visit the game show page for "([^\"]+)"$/ do |game_name|
#  Then "show page"
  @game = Game.where("name = ?", game_name).first()
  visit game_path(@game)
end
