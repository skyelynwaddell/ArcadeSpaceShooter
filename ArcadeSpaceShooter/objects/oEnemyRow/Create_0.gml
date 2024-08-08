/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

spd =0.6
hp = 500
yspd = 0
yspdDefault = yspd
shootTimer = 50
nonDirShootTimer = 0

MOVE= 0
WAIT = 1
GODOWN = 2
SPLIT = 3
UNSPLIT = 4

splitDirection = 0

state = GODOWN

splitTime = 0
splitTimeMax = 0
shoot = false
xspd = 0

array_push(global.enemies[0],id)
if array_length(global.enemies[0]) > 10 {
	instance_destroy(id)
}