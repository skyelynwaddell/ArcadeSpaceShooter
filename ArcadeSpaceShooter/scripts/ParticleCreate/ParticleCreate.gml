function ParticleCreate(emitterObj, sprite=false){
	var e = emitterObj
	var p = part_type_create();
	part_type_shape(p,pt_shape_square)
	part_type_scale(p,e.scaleMin, e.scaleMax)
	part_type_size(p,e.sizeMin,e.sizeMax,e.sizeIncr,e.sizeWiggle)
	part_type_color2(p,e.color1,e.color2)
	part_type_alpha2(p,e.alpha1,e.alpha2)
	part_type_speed(p,e.spdMin,e.spdMax,e.spdIncr,e.spdWiggle)
	part_type_direction(p,e.dirMin,e.dirMax,e.dirIncr,e.dirWiggle)
	part_type_gravity(p,e.grvty,e.grvtyDir)
	part_type_orientation(p,e.angleMin,e.angleMax,e.angleIncr,e.angleWiggle,true)
	part_type_life(p,e.lifeMin,e.lifeMax)
	part_type_blend(p,e.blend)
	if sprite!=false{
		part_type_sprite(p,sprite,0,1,1)
	}
	return p;
}