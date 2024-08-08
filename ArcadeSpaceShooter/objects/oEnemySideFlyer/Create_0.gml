/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

spd =1
hp = 1000
yspd = 0
yspdDefault = yspd

MOVE= 0
WAIT = 1

state = MOVE

shoot = false
xspd = 1.5

array_push(global.enemies[0],id)
if array_length(global.enemies[0]) > 4 {
	instance_destroy(id)
}