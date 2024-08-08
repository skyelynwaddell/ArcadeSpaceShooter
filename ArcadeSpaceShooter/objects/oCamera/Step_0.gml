if !instance_exists(oPlayer) {
	if instance_exists(oMiniboss1){
		target = oMiniboss1
	} else target = noone
}

if target != noone {
	xto = target.x
	yto = target.y
}

var camx = x - (w*pos)
x += (xto - x) / 25

if instance_exists(oCameraBoundaries){
	var boundLeft = oCameraBoundaries.x
	var boundRight = oCameraBoundaries.x + oCameraBoundaries.sprite_width
	var boundTop = oCameraBoundaries.y
	var boundBottom = oCameraBoundaries.y + oCameraBoundaries.sprite_height
	
	camx = max(boundLeft, min(camx, boundRight - w))
}


	
if screenShake > 0 {
	screenShake -= 1
	randX = random_range(-shakeAmount,shakeAmount)	
	randY = random_range(-shakeAmount,shakeAmount)	
} else {
	randX = 0 
	randY = 0
}

var xx = camx + randX
var yy = y = h * 0.5

camera_set_view_pos(
	view_camera[0],
	xx,
	yy
)
