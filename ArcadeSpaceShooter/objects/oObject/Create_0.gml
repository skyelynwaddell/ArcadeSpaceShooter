
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