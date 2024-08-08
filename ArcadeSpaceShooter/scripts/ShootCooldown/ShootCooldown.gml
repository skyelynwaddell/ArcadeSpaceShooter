function ShootCooldown(){
	shotWait.current--;
	shotCooldown.current--
	if shotCooldown.current <= 0{
		shots.current = shots.maximum	
	}
}