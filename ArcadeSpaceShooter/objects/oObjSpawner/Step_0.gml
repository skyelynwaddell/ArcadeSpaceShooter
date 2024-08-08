if cloudTimer > cloudSpawn {
	instance_create_depth(random_range(-32,room_width),0 - 32,10,oCloud)	
	cloudTimer = 0
}
cloudTimer++


if global.gameState == global.state.STARTMENU {
	return;	
}

if healthpackTimer > healthpackSpawn{
	//instance_create_depth(random_range(0,room_width-16),0 - 32,10,oHealthPack)	
	healthpackTimer = 0
}
healthpackTimer ++


//enemies
switch(global.gameState){
	//Phase 1
	case global.state.PHASE1:
		
		switch(global.round){
			case 0:
			case 1:
				if timer > enemySpawn and array_length(global.enemies[0]) <= 0{
					for (var i = 0; i < 4; i++){
						instance_create_depth(40*i,0 - 32,10,oEnemyBasic)	
					}
					timer = 0
					global.round += 1

				}
				if array_length(global.enemies[0]) <= 0 {
					timer++

				}
			break;
			case 2:
			case 3:
				if timer > enemySpawn and array_length(global.enemies[0]) <= 0{
					for (var i = 0; i < 3; i++){
						instance_create_depth(60*i,0 - 32,10,oEnemySideSweeper)	
					}
					timer = 0
					global.round += 1

				}
				if array_length(global.enemies[0]) <= 0 {
					timer++

				}
			break;
			case 4:
			case 5:
				if timer > enemySpawn and array_length(global.enemies[0]) <= 0{
					for (var i = 0; i < 3; i++){
						instance_create_depth(-32, 32 * i,10,oEnemySideFlyer)	
					}
					global.round += 1
					timer = 0
				}
				if array_length(global.enemies[0]) <= 0 {
					timer++

				}
			break;
			case 6:
			case 7:
				if timer > enemySpawn and array_length(global.enemies[0]) <= 0{
					for (var i = 0; i < 4; i++){
						var mon = instance_create_depth((0) + (40 *i ),0 - 32,10,oEnemyRow)	
						with(mon){
							if i == 0 {
								instance_destroy(id)	
							}
							if i == 1{ 
								splitDirection = -1
								splitTimeMax = 40
							} else
							if i == 2{ 
								splitDirection = -1
								splitTimeMax = 20
							} else
							if i == 3{ 
								splitDirection = -1
								splitTimeMax = 40
							} else
							if i == 4{ 
								splitDirection = -1
								splitTimeMax = 20
							} else
							if i == 5{ 
								splitDirection = -1
								splitTimeMax = 60
							}
	
						}
					}
					timer = 0
					global.round += 1
				}
				if array_length(global.enemies[0]) <= 0 {
					timer++
				}
			break;
			case 10:
			//case 1:
			//case 2:
				if timer > enemySpawn and array_length(global.enemies[0]) <= 0{
					instance_create_depth(128/2,0 - 32,10,oMiniboss1)	
					timer = 0
					global.round += 1
				}
				if array_length(global.enemies[0]) <= 0 {
					timer++
				}
			break;
			case 8:
			case 9:
			//case 10:
			//case 11:
				if timer > enemySpawn and array_length(global.enemies[0]) <= 0{
					
					for (var i=0; i < 20; i++;){
						var spawnEnemy = function(){
							instance_create_depth(128/2,0 - 32,10,oEnemySmallBugs)	
						}
						if i == 0 {
							spawnEnemy = function(){
								var en = instance_create_depth(128/2,0 - 32,10,oEnemySmallBugs)	
								with(en)
								{
									sprite_index = sWormHead	
								}
							}
						}
						call_later(10*i,time_source_units_frames,spawnEnemy)
					}
					timer = 0
					global.round += 1
				}
				if array_length(global.enemies[0]) <= 0 {
					timer++
				}
			break;
			case 11:
			case 12:
				global.gameState = global.state.STAGECOMPLETE
				

			break;
		}
	break;
}

print(global.round)