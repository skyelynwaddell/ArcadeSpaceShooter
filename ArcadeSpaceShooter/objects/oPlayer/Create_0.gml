 mvtLocked = 0;
 
 switch(global.shipIndex){
	    default:
		case 0: sprite_index = sPlayer break; 
		case 1: sprite_index = sPlayer2 break; 
		case 2: sprite_index = sPlayer3 break; 
 }
 defaultSprite = sprite_index;


btn = InitButtons()
dirx = 0;
diry = 0;
xspd = 0;
yspd = 0;
spd = 1.5;
acceleration = 0.9; 
frict = 0.9;
grvty = { current: 0.1, def: 0.1, wallslide: 0.05 }
damageTimer = 0
godmode = 0
gameOverTimer = 0
gameOverAlpha = 0
isOnFloor = false;
isOnWall = false;

jumpHeight = -2;
jumpCount = { current : 1, max : 1 };

dashSpeed = 3;
dashHeight = -3;
dashDuration = 20;
canDash = true;

shots = { current: 3, maximum: 3 }
shotWait = { current: 0, maximum: 4 }
shotCooldown = { current: 0, maximum:0 } //25 }
muzzleSubImg = 0

weapons = [
	{ type: "default" },
	{ type: "triple" },
	{ type: "laserbeam" },
]

weapon = weapons[0].type

wallJumpSpeed = 3;
wallJumpHeight = -2;
wallJumpDuration = 20;
image_speed = 0;

enum STATE {
    IDLE,
    RUN,
    JUMP,
    FALL,
    DASH,
    WALLSLIDE,
    LOOKUP,
    CROUCH,
}

state = STATE.IDLE;

shadow = instance_create_depth(x,y+16,depth,oShadow)
depth = -100

var e; //emitter
//Smoke Trail Particles
e = {

//Life
lifeMin : 2,
lifeMax : 2,

//Depth
Depth : -90,

//Scale
scaleMin : 0.2,
scaleMax : 0.2,

//Size
sizeMin : 0.1,
sizeMax : 0.4,
sizeIncr : -0.01,
sizeWiggle : 0,

//Color & Alpha
color1 : c_white,
color2 : c_yellow,
alpha1 : 1,
alpha2 : 1,

//Speed
spdMin : 0.1,
spdMax : 0.1,
spdIncr : 0,
spdWiggle : 0,

//Direction
dirMin : 0,
dirMax : 0,
dirIncr : 0,
dirWiggle : 0,

//Gravity
grvty : -2,
grvtyDir : 90,

//Angle
angleMin : 0,
angleMax : 0,
angleIncr : 0,
angleWiggle : 0,

//Blendmode
blend : false,
}

PS1 = ParticleSystemCreate(e);
p = ParticleCreate(e)

smokeEmitter = part_emitter_create(PS1)
part_emitter_stream(PS1,smokeEmitter,p,10);


//big explosion upon death
var e2; //emitter
//Smoke Trail Particles
e2 = {

//Life
lifeMin : 60,
lifeMax : 100,

//Depth
Depth : -10000,

//Scale
scaleMin : 0.2,
scaleMax : 0.2,

//Size
sizeMin : 0.5,
sizeMax : 3,
sizeIncr : 0.02,
sizeWiggle : 0,

//Color & Alpha
color1 : c_white,
color2 : #4b4b4b,
alpha1 : 1,
alpha2 : 1,

//Speed
spdMin : 0,
spdMax : 0,
spdIncr : 0,
spdWiggle : 0,

//Direction
dirMin : 270,
dirMax : 270,
dirIncr : 0,
dirWiggle : 0,

//Gravity
grvty : 0.005,
grvtyDir : 270,

//Angle
angleMin : 90,
angleMax : 0,
angleIncr : 0,
angleWiggle : 0,

//Blendmode
blend : false,
}
explosionFrame = 0
explosion = false
explosionTime = 0

PS2 = ParticleSystemCreate(e2);
p2 = ParticleCreate(e2,sExplosion)

explosionEmtter = part_emitter_create(PS2)

//mini explosion every shot
var e3; //emitter
//Smoke Trail Particles
e3 = {

//Life
lifeMin : 60,
lifeMax : 100,

//Depth
Depth : -10000,

//Scale
scaleMin : 0.2,
scaleMax : 0.2,

//Size
sizeMin : 1,
sizeMax : 3,
sizeIncr : -0.02,
sizeWiggle : 0,

//Color & Alpha
color1 : c_white,
color2 : #4b4b4b,
alpha1 : 1,
alpha2 : 1,

//Speed
spdMin : 0,
spdMax : 0,
spdIncr : 0,
spdWiggle : 0,

//Direction
dirMin : 270,
dirMax : 270,
dirIncr : 0,
dirWiggle : 0,

//Gravity
grvty : 0.005,
grvtyDir : 270,

//Angle
angleMin : 90,
angleMax : 0,
angleIncr : 0,
angleWiggle : 0,

//Blendmode
blend : false,
}
miniExplosionFrame = 0
miniExplosion = false
miniExplosionTime = 0

PS3 = ParticleSystemCreate(e3);
p3 = ParticleCreate(e3,sMiniExplosion)

miniExplosionEmitter = part_emitter_create(PS3)

//mini explosion every shot
var e4; //emitter
//Smoke Trail Particles
e4 = {

//Life
lifeMin : 60,
lifeMax : 100,

//Depth
Depth : depth+1,

//Scale
scaleMin : 0.2,
scaleMax : 0.2,

//Size
sizeMin : 1,
sizeMax : 3,
sizeIncr : -0.02,
sizeWiggle : 0,

//Color & Alpha
color1 : #4b4b4b,
color2 : #4b4b4b,
alpha1 : 1,
alpha2 : 1,

//Speed
spdMin : 0,
spdMax : 0,
spdIncr : 0,
spdWiggle : 0,

//Direction
dirMin : 270,
dirMax : 270,
dirIncr : 0,
dirWiggle : 0,

//Gravity
grvty : 0.005,
grvtyDir : 270,

//Angle
angleMin : 90,
angleMax : 0,
angleIncr : 0,
angleWiggle : 0,

//Blendmode
blend : false,
}
hurtExplosionFrame = 0
hurtExplosion = false
hurtExplosionTime = 0

PS4 = ParticleSystemCreate(e4);
p4 = ParticleCreate(e4,sMiniExplosion)

hurtExplosionEmitter = part_emitter_create(PS4)
