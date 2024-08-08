time = 0
hitmarkerTimer = 0
gameoverTimer = 0
logox = gui_width()/2 - 8 * 54
logoy = gui_height()/2 - 200
emitterY = 128/2 - 28
gameOverIndex = 0
indexTimer = 0

global.score = 0
global.round = 0
global.hp.current = global.hp.maximum
global.time = 0

//big explosion upon death
var e2; //emitter
//Smoke Trail Particles
emit = 0
e2 = {

//Life
lifeMin : 100,
lifeMax : 200,

//Depth
Depth : -10000,

//Scale
scaleMin : 0.7,
scaleMax : 0.8,

//Size
sizeMin : 1.3,
sizeMax : 1.3,
sizeIncr : 0.000,
sizeWiggle : 0,

//Color & Alpha
color1 : #61d3e3,
color2 : #305182,
alpha1 : 1,
alpha2 : 0,

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
grvty : 0.0005,
grvtyDir : 270,

//Angle
angleMin : 90,
angleMax : 0,
angleIncr : 0,
angleWiggle : 0,

//Blendmode
blend : 1,
}
explosionFrame = 0
explosion = false
explosionTime = 0

PS2 = ParticleSystemCreate(e2);
p2 = ParticleCreate(e2,sStageComplete)

explosionEmtter = part_emitter_create(PS2)
part_emitter_interval(PS2,explosionEmtter,20,40, time_source_units_frames)