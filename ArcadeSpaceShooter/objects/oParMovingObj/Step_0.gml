if global.freezeGame return;

if moving {
y += spd;
}

function BehindShadow(){
if instance_exists(oShadow){
	depth = oShadow.depth - 1;	
}
}