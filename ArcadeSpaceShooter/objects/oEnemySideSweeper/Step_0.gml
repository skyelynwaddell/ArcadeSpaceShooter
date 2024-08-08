/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();
//BehindShadow

if global.freezeGame return;


depth = -400

var _age = 30
switch(state){
	case WAIT:
		yspd = lerp(yspd,0,0.01)
		if age > _age {
			age = 0
			yspd = yspdDefault * -1
			yspdDefault = yspd
			
			if  sign(yspd) == -1{
				shoot = true
			}
			
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

if shoot {
	shoot  = false
	for (var i=0; i < 4; i++) {
		
		var SpawnBullet = function(){
			var bullet = instance_create_depth(x+16 ,y+16,-10000,oEnemyBullet)
			if instance_exists(oPlayer){
				with(bullet){
					direction = point_direction(x,y,oPlayer.x,oPlayer.y)
					defaultSpd = 0.4
					sprite_index = sEnemyBulletOrange
			
				}
			}
		}
		call_later(10*i, time_source_units_frames,SpawnBullet)
	}
}
x+=xspd
y+=yspd
