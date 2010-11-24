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

Given /^I am signed in as "([^"]+)" with password "([^"]+)"$/ do |username, password|
  visit new_user_session_url
  fill_in "Username", :with => username
  fill_in "Password", :with => password
  click_button "Sign in"
end