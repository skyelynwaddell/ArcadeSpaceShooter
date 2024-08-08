draw_self()

var xx,yy,ww,hh

if hitmarker > 0 {
	hitmarker--
	xx = x + sprite_width/2
	yy = y + sprite_height/2
	ww = hitmarker * 0.2
	hh = hitmarker * 0.2
	draw_sprite_ext(sHitmarker,0,xx,yy,ww,hh,0,c_white,1)
}
