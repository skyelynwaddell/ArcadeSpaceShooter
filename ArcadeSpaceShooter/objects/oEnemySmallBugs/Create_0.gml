/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

spd =1
hp = 200
yspd = 2
yspdDefault = yspd

MOVE= 0
WAIT = 1

state = MOVE

shoot = false
xspd = 0.6

goIn = false
array_push(global.enemies[0],id)
if array_length(global.enemies[0]) > 100 {
	instance_destroy(id)
}
pause = 0
shootTimer = 0