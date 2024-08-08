var w = 4
var scalex, scaley

switch(type){
	case "default":
		sprite_index = sPlayerBullet2
		scalex = random_range(0.6,1)
		scaley = random_range(0.5,1)
		draw_sprite_ext(sprite_index,image_index,x-w,y,scalex,scaley,0,c_white,1)
		draw_sprite_ext(sprite_index,image_index,x+w,y,scalex,scaley,0,c_white,1)
	break;
	case "triple":
		sprite_index = sPlayerBullet3
		scalex = random_range(0.6,1)
		scaley = random_range(0.5,1)
		draw_sprite_ext(sprite_index,image_index,x,y,scalex,scaley,0,c_white,1)
	break;
	case "laserbeam":
		sprite_index = sPlayerBullet3
		scalex = random_range(0.5,0.8)
		scaley = random_range(0.5,0.8)
		draw_sprite_ext(sprite_index,image_index,x,y,scalex,scaley,0,c_white,1)
	break;
}