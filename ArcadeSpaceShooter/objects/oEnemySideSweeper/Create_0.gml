/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

spd =1
hp = 500
yspd = random_range(0.5,0.6) + (global.round * 0.25)
yspdDefault = yspd

MOVE= 0
WAIT = 1

state = MOVE

shoot = false
xspd = 1

array_push(global.enemies[0],id)
if array_length(global.enemies[0]) > 4 {
	instance_destroy(id)
}