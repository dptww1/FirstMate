def create_or_update_scenario_side(scenario_id, side_id)
  ss = ScenariosSide.find_by_scenario_id_and_side_id(scenario_id, side_id)
  unless ss
    ScenariosSide.create!(:scenario_id => scenario_id, :side_id => side_id)
  end
end

s = Scenario.create_or_update( { :id => 0, :name => "Test Seven Ship Game" } )
create_or_update_scenario_side(s.id, Side::DENMARK)
create_or_update_scenario_side(s.id, Side::NETHERLANDS)

s = Scenario.create_or_update( { :id => 1, :name => "Trafalgar" } )
create_or_update_scenario_side(s.id, Side::BRITAIN)
create_or_update_scenario_side(s.id, Side::ALLIES)

s = Scenario.create_or_update( { :id => 2, :name => "Providien" } )
create_or_update_scenario_side(s.id, Side::BRITAIN)
create_or_update_scenario_side(s.id, Side::FRANCE)

s = Scenario.create_or_update( { :id => 3, :name => "Constitution vs Guerriere" } )
create_or_update_scenario_side(s.id, Side::US)
create_or_update_scenario_side(s.id, Side::BRITAIN)

