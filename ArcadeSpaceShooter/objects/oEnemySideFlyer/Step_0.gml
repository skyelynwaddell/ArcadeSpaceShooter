/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();
//BehindShadow

if global.freezeGame return;


depth = -400

var _age = 140
switch(state){
	case WAIT:
		//yspd = lerp(yspd,0,0.01)
		if age > 10 {
			age = 0
			//yspd = yspdDefault * -1
			//yspdDefault = yspd
			
		
			
			state = MOVE 
		}
	break;
	case MOVE:
		if age > _age {
			xspd = xspd *-1
			
			age = 0
			state = WAIT 
		}
	break;
}

	if  age == _age/2{
				shoot = true
			}

if shoot {
	shoot  = false
	for (var i=0; i < 6; i++) {
		
	var SpawnBullet = function(){
		var bullet = instance_create_depth(x+16 ,y+16,-10000,oEnemyBullet)
		if instance_exists(oPlayer){
			with(bullet){
				direction = point_direction(x,y,oPlayer.x,oPlayer.y) + random_range(-10,10)
				sprite_index = sEnemyBulletRed
				defaultSpd = random_range(0.4,0.9)
				yspd = 0.1
			
			}
		}
		}
		
		call_later(10*i,time_source_units_frames,SpawnBullet)
	}
}
x+=xspd
y+=yspd
