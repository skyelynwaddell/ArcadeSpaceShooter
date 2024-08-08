

if global.gameState != global.state.STAGECOMPLETE and
   global.gameState  != global.state.GAMEOVER {
   
	scaleX = random_range(0.7,1.3)
	scaleY = random_range(0.5,1.3)
	if btn.a{
			draw_sprite_ext(sMuzzleFlash,muzzleSubImg,x,y-8,scaleX,scaleY,0,c_white,1)
	}
}

draw_self()