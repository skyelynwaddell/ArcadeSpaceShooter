if !instance_exists(oPlayer) return;

if place_meeting(x,y,oPlayer){
	switch(type){
		case "healthpack":
			global.hp.current += 50
			global.hp.current = clamp(global.hp.current,0,100)
		break;
	}
	
	instance_create_depth(x,y,depth,oGlowRing)
	instance_destroy(id);
}	

event_inherited()