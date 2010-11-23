# -*- mode: feature -*- 

And /^(?:|I )set the "([^"]+)" timestamp to "([^"]*)"$/ do |field_name, ts_spec|
  ts_spec.match(/^(\d{4})-(\d\d?)-(\d\d?) (\d\d?):(\d\d?)$/)
  yyyy, mm, dd, hh, mi = $1, $2, $3, $4, $5
  
  And %{I select "#{yyyy}" from "#{field_name}_1i"}
  And %{I select "#{mm}" from "#{field_name}_2i"}
  And %{I select "#{dd}" from "#{field_name}_3i"}
  And %{I select "#{hh}" from "#{field_name}_4i"}
  And %{I select "#{mi}" from "#{field_name}_5i"}
end
