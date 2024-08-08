if instance_exists(oPlayer){
	
		var _pow = pow
		with(oPlayer){
			
			if godmode <= 0 {
				ScreenShake();
				global.hp.current -= _pow
				sprite_index = sPlayerWhite
				damageTimer = 200
				miniExplosion = true
				miniExplosionTime = 0
				godmode = 100
			}
		}
}
