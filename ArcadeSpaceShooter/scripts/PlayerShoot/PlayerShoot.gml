function PlayerShoot(){
	
	if shotWait.current <= 0 and shots.current > 0 {
		shots.current--
		shotWait.current = shotWait.maximum	
		shotCooldown.current = shotCooldown.maximum
		
		var _wep = weapon

		switch(weapon){
			case "default":
				var bullet = instance_create_depth(x,y,depth,oBullet)
				with(bullet) type = _wep
				shotWait.maximum = 4
			break;
			case "laserbeam":
				var bullet = instance_create_depth(x,y,depth,oBullet)
				with(bullet) type = _wep
				shotWait.maximum = 1
			break;
			case "triple":
				var bullet = instance_create_depth(x,y,depth,oBullet)
				with(bullet) type = _wep
				shotWait.maximum = 2
				
				bullet = instance_create_depth(x,y,depth,oBullet)
				with(bullet) direction = 90 + 30
				with(bullet) type = _wep

				bullet = instance_create_depth(x,y,depth,oBullet)
				with(bullet) direction = 90 - 30
				with(bullet) type = _wep
			break;
		}
		
	}
}