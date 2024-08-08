/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();
//BehindShadow

if global.freezeGame return;


depth = -400

var _age = 200
switch(state){
	case GODOWN:
	if splitTimeMax == 0 nonDirShootTimer --
	if nonDirShootTimer <= 0{
		shoot = true
		nonDirShootTimer = 200
	}
		y+=2
		if y > 32 {
			state = SPLIT	
		}
	break
	case SPLIT:
	if splitDirection != 0 
	y+= spd
	
		x += spd * splitDirection 
		splitTime ++
		if splitTime >= splitTimeMax * 2 {
				shoot = true;
				splitTime = 0
				state = UNSPLIT
		}
	break;
	case UNSPLIT:
	
	if splitDirection != 0
		y -= spd 
	x -= spd * splitDirection 
		splitTime ++
		if splitTime >= splitTimeMax * 2 {
				state = SPLIT
				shootTimer = 50
				splitTime = 0
		}
	break;
}

if shootTimer > 0 shootTimer -= 1

if shoot and shootTimer <= 0 {
	shoot  = false
	
	for (var i=0; i <4; i++){
		var SpawnBullet = function(){
			var bullet = instance_create_depth(x + 16,y+16,-10000,oEnemyBullet)
			if instance_exists(oPlayer){
				with(bullet){
					direction = point_direction(x,y,oPlayer.x,oPlayer.y)
					defaultSpd = 0.4
			
				}
			}
		}
		
		call_later(10*i,time_source_units_frames,SpawnBullet)
}
}
