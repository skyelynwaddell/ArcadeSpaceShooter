/// @description Insert description here
// You can write your code in this editor
if instance_exists(shadow){
	var _x = x + sprite_width/2
	var _y = y + 32
	with(shadow){
		x = _x
		y = _y
	}
}

if global.freezeGame return

// Inherit the parent event
event_inherited();

if explosion {
	if instance_exists(shadow){
	with(shadow){
		instance_destroy()
	}
}

part_emitter_region(PS2, explosionEmtter, x+16, x+16, y, y+16, ps_shape_ellipse, ps_distr_gaussian);
part_type_subimage(p2, explosionFrame);
part_emitter_stream(PS2,explosionEmtter,p2,2)
print("exploding")
explosionFrame += 0.01
explosionFrame = explosionFrame % 1

explosionTime++

}

if explosionTime > explosionTimeMax  {
	explosion = false
	part_emitter_region(PS2, explosionEmtter, 1000, 1000, 1000,1000, ps_shape_ellipse, ps_distr_gaussian);
	if hp <= 0 instance_destroy(id)

}


if miniExplosion {
part_emitter_region(PS3, miniExplosionEmitter, x+16, x+16, y+16, y+16, ps_shape_ellipse, ps_distr_gaussian);
part_type_subimage(p3, miniExplosionFrame);
part_emitter_stream(PS3,miniExplosionEmitter,p3,2)
print("exploding")
miniExplosionFrame += 0.01
miniExplosionFrame = miniExplosionFrame % 1

miniExplosionTime++

}

if miniExplosionTime > explosionTimeMax  {
	miniExplosion = false
	part_emitter_region(PS3, miniExplosionEmitter, 1000, 1000, 1000,1000, ps_shape_ellipse, ps_distr_gaussian);
}

age++