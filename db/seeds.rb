# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

Role.create( { :name => 'Admin'   } )   # responsible for entire game
Role.create( { :name => 'CinC'    } )   # responsible for entire side
Role.create( { :name => 'Admiral' } )   # responsible for group of ships
Role.create( { :name => 'Captain' } )   # responsible for single ship

Side.create( { :name => 'Britain'    , :adjective => 'British'  } )
Side.create( { :name => 'Spain'      , :adjective => 'Spanish'  } )
Side.create( { :name => 'US'         , :adjective => 'American' } )
Side.create( { :name => 'France'     , :adjective => 'French'   } )
Side.create( { :name => 'Netherlands', :adjective => 'Dutch'    } )
Side.create( { :name => 'Denmark'    , :adjective => 'Danish'   } )
Side.create( { :name => 'Allies'     , :adjective => 'Allied'   } )

DeadlineType.create( { :name => 'Move Orders' } )
DeadlineType.create( { :name => 'Fire Orders' } )
