function ParticleSystemCreate(emitterObject){
	PS = part_system_create();
	part_system_depth(PS,emitterObject.Depth)
	part_system_position(PS,0,0)
	return PS
}