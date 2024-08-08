/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

spd =1
global.minibosshp.current = global.minibosshp.maximum
hp = global.minibosshp.current
yspd = random_range(0.5,0.6)
yspdDefault = yspd

MOVE= 0
WAIT = 1

state = MOVE

shoot = false
xspd = 0.2
numBullets = 20
angleStep = 0
explosionTimeMax = 200

global.gameState = global.state.MINIBOSS

array_push(global.enemies[0],id)
if array_length(global.enemies[0]) > 4 {
	instance_destroy(id)
}

shootSwitch = 0