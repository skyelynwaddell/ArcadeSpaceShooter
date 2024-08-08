var c = c_black
var s = 128 * 8
draw_set_alpha(alpha)
draw_rectangle_color(0,0,s,s,c,c,c,c,0)	
if global.fadeToBlack{
	with(oShadow) instance_destroy();
	alpha = lerp(alpha,1,fadeSpd)
	
	if alpha >= 0.9
{
	
	room_goto(global.level)
	global.fadeToBlack = false
	global.fadeFromBlack = true
}
} else
if global.fadeFromBlack {
	alpha = lerp(alpha,0,fadeSpd)
	if alpha == 0 global.fadeFromBlack = false
}
print(alpha)
if keyboard_check_pressed(ord("3")) global.fadeToBlack = true
if keyboard_check_pressed(ord("2")) global.fadeFromBlack = true

	draw_set_alpha(1)
