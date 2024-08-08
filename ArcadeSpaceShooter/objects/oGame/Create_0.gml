///@description Create Event
depth = -10000
randomize();
global.score = 0
global.accuracy = 100
global.totalShots = 0
global.hits = 0
global.hp = { current: 100 , maximum: 100 }
global.minibosshp = { current: 30000, maximum:30000}
global.hitmarker = false
global.shipIndex = 0
global.stage = "level1"
global.level = rmMainMenu
global.enemies = [
[], //enemy1
]
global.round = 0
global.time = 0
global.freezeGame = false
global.miniboss = false
global.fadeToBlack = false
global.fadeFromBlack = false
alpha = 0
fadeSpd = 0.1

//map
segScaleY = 128
tilemapSpd = 0.3
global.bossFight = true

initY = 0
yy = initY
xx = 0

mapSegs = [
	//level 1
	1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,
]
level1 = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16]
bossLevel = [1,2, 3]

currentLevel = level1
//currentLevel = array_shuffle(currentLevel)

global.spawnX = room_width/2 + 16
global.spawnY = room_height/2

global.ship = [
	{
	name:"skye",
	pow:10,
	def:5,
	spd:5
	},
	{
	name:"tora",
	pow:5,
	def:10,
	spd:5
	},
	{
	name:"umi",
	pow:5,
	def:5,
	spd:10
	},

]

global.state = {
	STARTMENU : 0,
	GAMEOVER : 1,
	PHASE1 : 2,
	PHASE2: 3,
	MINIBOSS: 4,
	PHASE3: 5,
	PHASE4: 6,
	BOSS: 7,
	STAGECOMPLETE: 8,
	STAGECOMPLETE2: 9,
}

global.gameState = global.state.STARTMENU


var e2; //emitter
//Smoke Trail Particles
e2 = {

//Life
lifeMin : 500,
lifeMax : 500,

//Depth
Depth : -90,

//Scale
scaleMin : 0.03,
scaleMax : 0.03,

//Size
sizeMin : 0.01,
sizeMax : 1,
sizeIncr : 0,
sizeWiggle : 0,

//Color & Alpha
color1 : c_white,
color2 : c_white,
alpha1 : 1,
alpha2 : 1,

//Speed
spdMin : 0,
spdMax : 0,
spdIncr : 0,
spdWiggle : 0,

//Direction
dirMin : 280,
dirMax : -10,
dirIncr : 0,
dirWiggle : 10,

//Gravity
grvty : 0.05,
grvtyDir : 0,


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
p2 = ParticleCreate(e2)

explosionEmtter = part_emitter_create(PS2)
part_emitter_region(PS2, explosionEmtter, 0, 0, -50, room_height+50, ps_shape_ellipse, ps_distr_gaussian);

if room == rmInit room_goto(rmLevel1)


