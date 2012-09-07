Phase.create_or_update( { 
                          :id               => 0, 
                          :game_template_id => 0, 
                          :seq_num          => 0,
                          :name             => "Crew", 
                          :permissions      => "--",
                          :template         => "S1:- S2:- S3:- S4:- M:- FSS:"
                        } )

Phase.create_or_update( { 
                          :id               => 1, 
                          :game_template_id => 0, 
                          :seq_num          => 1,
                          :name             => "Movement",  
                          :permissions      => "TT",
                          :template         => "SS:FS S1P2",
                        } )

Phase.create_or_update( { 
                          :id               => 2, 
                          :game_template_id => 0, 
                          :seq_num          => 2,
                          :name             => "Signal",
                          :permissions      => "TT",
                          :template         => "<<RECEIVER>>: YOUR WORDS HERE"
                        } )

Phase.create_or_update( {
                          :id               => 3, 
                          :game_template_id => 0, 
                          :seq_num          => 3,
                          :name             => "Fire", 
                          :permissions      => "TT",
                          :template         => <<END_FIRE_TEMPLATE
Target: EnemyShipName
Range:  0
Aim:    Hull

xx: Basic Gunnery Number
+0: Rake
+0: Guns Dismounted
xx: Final Gunnery Number
END_FIRE_TEMPLATE
                        } )

Phase.create_or_update( { 
                          :id               => 4, 
                          :game_template_id => 0, 
                          :seq_num          => 4,
                          :name             => "Grappling", 
                          :permissions      => "TT",
                          :template => "Grapple TargetShipName" 
                        } )
