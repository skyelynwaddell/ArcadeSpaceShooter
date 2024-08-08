if global.gameState = global.state.STAGECOMPLETE return;

if instance_exists(oMiniboss1){
	if oMiniboss1.hp <= 0 return;	
}

if godmode > 0 godmode -= 1;

if explosion {
xspd = 0
yspd = 0
if part_system_exists(PS2) && part_emitter_exists(PS2,explosionEmtter) and part_type_exists(p2) {
part_emitter_region(PS2, explosionEmtter, x, x, y, y, ps_shape_ellipse, ps_distr_gaussian);
part_type_subimage(p2, explosionFrame);
part_emitter_stream(PS2,explosionEmtter,p2,2)
}
//print("exploding")
explosionFrame += 0.01
explosionFrame = explosionFrame % 1
global.freezeGame = true
visible = false
explosionTime++
}

if explosionTime >= 150  {
	global.gameState = global.state.GAMEOVER
	explosion = false
	//part_emitter_region(PS2, explosionEmtter, 1000, 1000, 1000,1000, ps_shape_ellipse, ps_distr_gaussian);
	//instance_destroy(id)
	//game_restart()

}

if global.freezeGame return;

if global.gameState == global.state.STARTMENU and instance_exists(oCamera) {
	 instance_destroy(id)

	return;
}

visible = true;

btn = InitButtons();

var haxis = gamepad_axis_value(0, gp_axislh);
var vaxis = gamepad_axis_value(0, gp_axislv);

if haxis < -0.5 btn.left = true
else if haxis > 0.5 btn.right = true

if vaxis < -0.5 btn.up = true
else if vaxis > 0.5 btn.down = true

MvtLocked();
PlayerDirection();
PlayerAcceleration();
PlayerCollisions()

var _x = x 
var _y = y


if btn.a{
	PlayerShoot();	
	ScreenShake(10,0.4)
	muzzleSubImg++
} else {
	muzzleSubImg = 0
}

ShootCooldown()
if keyboard_check(ord("2")) weapon = weapons[0].type
if keyboard_check(ord("1")) weapon = weapons[1].type
if keyboard_check(ord("3")) weapon = weapons[2].type

var _y = y 
var _x = x

if instance_exists(shadow){
	with(shadow){
		x = _x
		y = _y + 16
	}
}

part_emitter_region(PS1, smokeEmitter, x-4, x+4, y+16, y, ps_shape_ellipse, ps_distr_gaussian);




if miniExplosion {
part_emitter_region(PS3, miniExplosionEmitter, x, x, y, y, ps_shape_ellipse, ps_distr_gaussian);
part_type_subimage(p3, miniExplosionFrame);
part_emitter_stream(PS3,miniExplosionEmitter,p3,2)
print("exploding")
miniExplosionFrame += 0.01
miniExplosionFrame = miniExplosionFrame % 1

miniExplosionTime++

}

if miniExplosionTime > 10  {
	miniExplosion = false
	part_emitter_region(PS3, miniExplosionEmitter, 1000, 1000, 1000,1000, ps_shape_ellipse, ps_distr_gaussian);
}

if global.hp.current <= 40 {
part_emitter_region(PS4, hurtExplosionEmitter, x, x, y+8, y+8, ps_shape_ellipse, ps_distr_gaussian);
part_type_subimage(p4, hurtExplosionFrame);
part_emitter_stream(PS4,hurtExplosionEmitter,p4,2)
print("exploding")
hurtExplosionFrame += 0.01
hurtExplosionFrame = hurtExplosionFrame % 1

hurtExplosionTime++

}

if global.hp.current <= 0 explosion = true 