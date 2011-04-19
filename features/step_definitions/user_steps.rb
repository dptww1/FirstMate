Given /^I am not signed in$/ do
  visit("/users/sign_out")
end

Given /^the following user records$/ do |table|
  table.hashes.each do |h|
    User.create!(:username              => h["username"],
                 :password              => h["password"], 
                 :password_confirmation => h["password"],
                 :email                 => h["email"],
                 :timezone              => h["timezone"])
  end
end

Given /^I am signed in as "([^\"]+)"$/ do |username|
  Given "I am signed in as \"#{username}\" with password \"xxx\""
end

Given /^I am signed in as "([^\"]+)" with password "([^\"]+)"$/ do |username, password|
  visit new_user_session_url
  fill_in "Username", :with => username
  fill_in "Password", :with => password
  click_button "Sign in"
end

Given /^"([^\"]+)" is (Captain|Admiral) of "([^\"]+)" on (Side\d)$/ do |name, role, ship, side|
  u = User.create!(:username => name, 
                   :password => "xxx", 
                   :password_confirmation => "xxx", 
                   :email => "townsend@patriot.net", 
                   :timezone => "Indiana (East)")
  g = Game.order("created_at DESC")[0]  # assumes most recent game was created by earlier clause in feature
  sq = g.squadrons_by_side(side)[0]
  sq.squadrons_ships << SquadronsShip.new(:name => ship, :user_id => u.id)
end
