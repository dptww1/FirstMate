Then /^show page$/ do
  $stderr.puts page.body
end

# ==== Doesn't work, don't have gem and installing it gets failures ====
#Then /^debugger$/ do
#  debugger
#end
