/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();
//BehindShadow

if global.freezeGame return;


depth = -400

var _age = 70
switch(state){
	case WAIT:
		yspd = lerp(yspd,0,0.01)
		if age > _age {
			age = 0
			yspd = yspdDefault * -1
			yspdDefault = yspd
			

			
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

if age == _age && sign(yspd) == 1 {
	shoot = true 
}

if shoot {
	//shoot  = false
	for (var i=0; i<2 + global.round; i++){

		
		var ShootBullet = function(){
		var spawnBullet = function(){
			 return instance_create_depth(x+8,y+16,-10000,oEnemyBullet)
		}
			var bullet = spawnBullet()
			if instance_exists(oPlayer){
				with(bullet){
					direction = point_direction(x,y,oPlayer.x,oPlayer.y)	
					sprite_index = sEnemyBullet2
				}
			} 
		}
		
		call_later(10*i,time_source_units_frames,ShootBullet)
		
	}
	shoot = false
}
pause --
pause = clamp(pause,0,100)
x+=xspd
y+=yspd

if instance_exists(shadow){
	var _x = x + sprite_width/2
	var _y = y + 20
	with(shadow){
		x = _x
		y = _y
	}
}
