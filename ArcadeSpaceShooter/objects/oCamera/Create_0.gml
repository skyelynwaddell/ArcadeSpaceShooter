//camera
w = 128
h = 128
pos = 0.5
target = noone
xto = gui_width()/2 + 16
yto = gui_height()/2
	
if instance_exists(oPlayer){
	target = oPlayer
	xto = oPlayer.x + 16
	yto = oPlayer.y
	pos = 0.5
} 

//screen shake
screenShake = 0
shakeDuration = 20;
shakeAmount = 6;
startCamX = camera_get_view_x(view_camera[0])
startCamY = camera_get_view_y(view_camera[0])
randX =0
randY = 0
