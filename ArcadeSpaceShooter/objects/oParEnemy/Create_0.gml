hp  = 10000//200
event_inherited()
depth = - 300
hitmarker = false
age = 0
state = 0
yspd = 1
pow = 10
explosionTimeMax  = 10

DestroyParticles = function(){

	if part_system_exists(PS2)
		part_system_destroy(PS2);
		
	if part_system_exists(PS3)
		part_system_destroy(PS3);
	print("destroyed parts")
}

shadow = instance_create_depth(x,y+sprite_width/2,depth,oShadow)