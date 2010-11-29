def create_or_update_scenario_side(scenario_id, side_id)
  ss = ScenariosSide.find_by_scenario_id_and_side_id(scenario_id, side_id)
  unless ss
    ScenariosSide.create!(:scenario_id => scenario_id, :side_id => side_id)
  end
end

def create_or_update_scenario_side_ship(scenario_id, side_id, ship_id)
  sss = ScenariosSidesShip.find_by_scenario_id_and_side_id_and_ship_id(scenario_id, side_id, ship_id)
  unless sss
    ScenariosSidesShip.create!(:scenario_id => scenario_id, :side_id => side_id, :ship_id => ship_id)
  end
end

ship_data = [
             [  0, "Constitution",     "44" ],
             [  1, "Guerriere",        "44" ],
             [  2, "Victory",         "100" ],
             [  3, "Royal Sovereign", "110" ],
             [  4, "Redoubtable",      "80" ],
             [  5, "Swiftsure",        "74" ],
             [  6, "Defiance",         "74" ],
             [  7, "Neptune",          "74" ],  # British
             [  8, "Neptune",          "74" ],  # French
             [  9, "Neptuno",          "74" ],  # Spanish
            ]
ship_data.each do |ship|
  Ship.create_or_update(:id => ship[0], :name => ship[1], :rating => ship[2])
end

s = Scenario.create_or_update( { :id => 0, :name => "Test Seven Ship Game" } )
create_or_update_scenario_side(s.id, Side::DENMARK)
create_or_update_scenario_side(s.id, Side::NETHERLANDS)

s = Scenario.create_or_update( { :id => 1, :name => "Trafalgar" } )
create_or_update_scenario_side(s.id, Side::BRITAIN)
create_or_update_scenario_side(s.id, Side::ALLIES)
create_or_update_scenario_side_ship(1, Side::BRITAIN, 2);
create_or_update_scenario_side_ship(1, Side::BRITAIN, 3);
create_or_update_scenario_side_ship(1, Side::BRITAIN, 6);
create_or_update_scenario_side_ship(1, Side::BRITAIN, 7);
create_or_update_scenario_side_ship(1, Side::ALLIES, 4);
create_or_update_scenario_side_ship(1, Side::ALLIES, 5);
create_or_update_scenario_side_ship(1, Side::ALLIES, 8);
create_or_update_scenario_side_ship(1, Side::ALLIES, 9);

s = Scenario.create_or_update( { :id => 2, :name => "Providien" } )
create_or_update_scenario_side(s.id, Side::BRITAIN)
create_or_update_scenario_side(s.id, Side::FRANCE)

s = Scenario.create_or_update( { :id => 3, :name => "Constitution vs Guerriere" } )
create_or_update_scenario_side(s.id, Side::US)
create_or_update_scenario_side(s.id, Side::BRITAIN)
create_or_update_scenario_side_ship(3, Side::US, 0) 
create_or_update_scenario_side_ship(3, Side::BRITAIN, 1)



