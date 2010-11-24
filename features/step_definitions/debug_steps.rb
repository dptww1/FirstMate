Then /^show page$/ do
  $stderr.puts page.body
end

Then /^debugger$/ do
  debugger
end
