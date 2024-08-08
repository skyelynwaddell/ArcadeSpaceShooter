/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();
//BehindShadow

if global.freezeGame return;

global.minibosshp.current = hp


depth = -400

var _age = 60
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
			
			//state = MOVE 
			xspd = 0
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
	shootSwitch = !shootSwitch
	numBullets = 20
	
	angleStep = 360/numBullets
	
	if shootSwitch {
		 angleStep = 350/numBullets
	}
	
	var ShootRowOfBullet = function(){
		for (var i=0; i<1; i++){
		var ShootBullet = function(){
		var spawnBullet = function(){
			 return instance_create_depth(x+16,y+16,-10000,oEnemyBullet)
		}
			var bullet = spawnBullet()
			if instance_exists(oPlayer){
				with(bullet){
					direction = point_direction(x,y,oPlayer.x,oPlayer.y)	
					sprite_index = sEnemyBulletRed2
				}
			} 
		}
		
		call_later(10*i,time_source_units_frames,ShootBullet)
	}
	}
	
	for(var i=0; i < 6; i++){
		call_later(10*i,time_source_units_frames,ShootRowOfBullet)
	}
	
	function RadialBurst(){
		if !instance_exists(oMiniboss1) return;
	for (var i=0; i < oMiniboss1.numBullets; i++){
	var bullet = instance_create_depth(oMiniboss1.x+16,oMiniboss1.y+16,-10000,oEnemyBullet)
	if instance_exists(oPlayer){
		with(bullet){
			var bulletDir = i * oMiniboss1.angleStep 
			direction = bulletDir
			
		}
	}
	}
	}
	
	RadialBurst()
	call_later(40,time_source_units_frames,RadialBurst)
	call_later(70,time_source_units_frames,RadialBurst)
	
	
}

if hp <= 0{
	with(oEnemyBullet) instance_destroy()
	var _id = id
	ScreenShake(50,3)
	//with(oCamera) target = _id
	with(oParEnemy) {
		//if id != _id
		//	instance_destroy()
	}
	with(oPlayer){
		xspd = 0
		yspd = 0
	}
}
x+=xspd
y+=yspd
