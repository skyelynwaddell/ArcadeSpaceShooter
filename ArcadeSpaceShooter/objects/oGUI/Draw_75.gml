draw_set_font(fntPico)
draw_set_halign(fa_left)
if global.fadeToBlack return;
InitButtons()

var xx,yy,ww,hh,txt
var cb = c_black
var cw= c_white
var s = 1

switch(global.gameState){
	case global.state.STARTMENU:
		ww = 400
		hh = 100

		xx = gui_width()/2 
		yy = gui_height()/2 - hh + 200
		txt = $"press start";
		draw_set_halign(fa_center)
		draw_text(xx-00,yy+300,"(c) skyescloud 2024")

		draw_rectangle_color(xx-300, yy, xx + 300, yy +hh, cb,cb,cb,cb,0)
		draw_text_ext_transformed_color(xx + 20,yy + 20,txt,100,1000,s,s,0,cw,cw,cw,cw,1)
		
		draw_sprite_ext(sLogo2,0,gui_width()/2 - 8 * 54,gui_height()/2 - 200 ,10,10,0,cw,1)
		
		
		if keyboard_check_pressed(vk_space) or btn.b{
			global.gameState = global.state.PHASE1	
			
			RoomGoto(rmMainMenu)
			
		}
		
	break;
	case global.state.MINIBOSS:
		
		ww = gui_width() - 20
		hh = 50

		xx = 10
		yy = gui_height() - hh - 10
		txt = "miniboss";

		draw_rectangle_color(xx, yy, xx + ww, yy +hh, cb,cb,cb,cb,0)
		draw_text_ext_transformed_color(xx+10 ,yy - 60,txt,100,1000,s,s,0,cw,cw,cw,cw,1)
		
		// Calculate the width of the health bar based on the current health
		var health_bar_width = (global.minibosshp.current / global.minibosshp.maximum) * ww;

		// Draw the health bar above the main rectangle
		var health_bar_height = 10;
		var health_bar_y = yy - health_bar_height - 5;
		var c = #db4161
		draw_rectangle_color(xx, yy, xx + health_bar_width, yy + hh, c, c, c, c, 0);
		
	case global.state.PHASE1:
		var _scoreX = 20
		var _scoreY = 20
		var _scoreW = 280
		var _scoreH = 80

		var scoreTxt = $"{global.score}"

		draw_rectangle_color(_scoreX, _scoreY, _scoreX + _scoreW, _scoreY +_scoreH, cb,cb,cb,cb,0)
		draw_text_ext_transformed_color(_scoreX + 20,_scoreY + 10,scoreTxt,100,1000,s,s,0,cw,cw,cw,cw,1)
		
		ww = 280
		hh = 80

		xx = 310
		yy = 20
		global.hp.current = clamp(global.hp.current,0,100)
		txt = global.hp.current;
		


		draw_rectangle_color(xx, yy, xx + ww, yy +hh, cb,cb,cb,cb,0)
		draw_text_ext_transformed_color(xx + 20,yy + 10,txt,100,1000,s,s,0,cw,cw,cw,cw,1)
		
		if global.hp.current > 0	time += 1 * delta_time;
		
		var _timerX = 20
		var _timerY = 110
		var _timerW = 280
		var _timerH = 80
		var timeReal = floor(time / 10000);
		var minutes = floor(timeReal / 100);
		var seconds = timeReal % 100;
		var _timerTxt = string(minutes) + ":" + string_format(seconds, 2, 0);
		var timerTxt = minutes < 10 ? $"0{_timerTxt}" : _timerTxt;

		draw_rectangle_color(_timerX, _timerY, _timerX + _timerW, _timerY +_timerH, cb,cb,cb,cb,0)
		draw_text_ext_transformed_color(_timerX + 20,_timerY + 10,timerTxt,100,1000,s,s,0,cw,cw,cw,cw,1)
		global.time = timerTxt
	break;
	case global.state.STAGECOMPLETE:
	
	if global.hp.current <= 0 global.gameState = global.state.GAMEOVER
	
	with(oBullet) instance_destroy()
	with(oEnemyBullet) instance_destroy()
	with(oParEnemy) instance_destroy()
	with(oParMovingObj) instance_destroy()
		
		var _gameOverTimer = 0;
		with(oPlayer){
			switch(global.shipIndex){
			case 0: sprite_index = sPlayer break;
			case 1: sprite_index = sPlayer2 break;
			case 2: sprite_index = sPlayer3 break;
			}
			image_index = 0
			
			var center = 128/2 + 16
			
			gameOverTimer++
			
			if gameOverTimer < 100 {
				x = lerp(x,center,0.1)
				y = lerp(y,center,0.1)
			} else 
			if gameOverTimer > 100{
				y = lerp(y,16,0.1)
				oGame.tilemapSpd = lerp(oGame.tilemapSpd,5,0.01)
			}
			
			_gameOverTimer = gameOverTimer

			if x == center && y == center{
			//	global.gameState = global.state.STAGECOMPLETE2
			}
		}
		draw_set_halign(fa_center)
		var str = "";
		var gap = 70
		var txtYY = gui_height()/2 - 180
			if _gameOverTimer > 400 {
				str = $"health: {global.hp.current}";
				draw_text(gui_width()/2 - string_length(str),txtYY,str)
			}
			if _gameOverTimer > 425 {
				str = $"accuracy: {global.accuracy}%";
				draw_text(gui_width()/2 - string_length(str),txtYY + gap,str)
			}
			if _gameOverTimer > 450 {
				str = $"score: {global.score}";
				draw_text(gui_width()/2 - string_length(str),txtYY + gap * 2,str)
			}
			if _gameOverTimer > 475{
				str = $"time: {global.time}";
				draw_text(gui_width()/2 - string_length(str),txtYY + gap * 3,str)
			}
			if _gameOverTimer > 500{
				str = $"ship: {global.ship[global.shipIndex].name}";
				draw_text(gui_width()/2 - string_length(str),txtYY + gap * 4,str)
			}
			
			if _gameOverTimer > 525{
				draw_sprite_ext(sReplay,0,60,txtYY + gap * 6.5,4,4,0,c_white,1)
				draw_sprite_ext(sContinue,0,490,txtYY + gap * 6.5,4,4,0,c_white,1)
				
				if gameOverIndex == 0 {
					draw_sprite_ext(sContinue,1,490,txtYY + gap * 6.5,4,4,0,c_white,1)
				} else {
					draw_sprite_ext(sReplay,1,60,txtYY + gap * 6.5,4,4,0,c_white,1)
				}
			}
			if _gameOverTimer > 250{
					logoy = lerp(logoy, 160,0.01)
					emitterY = lerp(emitterY,16,0.01)
			}
			
			draw_set_halign(fa_left)
			indexTimer ++

			part_emitter_region(PS2, explosionEmtter, 0, 128/2 - 20, emitterY, emitterY, ps_shape_ellipse, ps_distr_gaussian);
			part_type_sprite(p2,sStageComplete,0,0,0)
			part_type_subimage(p2, explosionFrame);
			
			part_emitter_stream(PS2,explosionEmtter,p2,1)
			draw_sprite_ext(sStageComplete,0,logox,logoy ,6,6,0,cw,1)
		
			if instance_exists(oPlayer){
				if btn.b and _gameOverTimer >= 560 {
				
				
					if part_system_exists(PS2)
						part_system_destroy(PS2);
					
					with(oPlayer) 
						instance_destroy();
					
					global.round = 0
					oGame.tilemapSpd = 0.3
					//replay
					if gameOverIndex == 1 {
						RoomGoto(rmLevel1)
					}
					//continue
					else if gameOverIndex == 0 {
						RoomGoto(rmMainMenu)
					}
					global.gameState = global.state.PHASE1
					}
			}
			
			var haxis = gamepad_axis_value(0, gp_axislh);
			var vaxis = gamepad_axis_value(0, gp_axislv);

			if haxis < -0.5 btn.left = true
			else if haxis > 0.5 btn.right = true
			
			if _gameOverTimer >= 560 {
				if btn.left gameOverIndex = 1
				if btn.right gameOverIndex = 0
			}
			
	break;
	case global.state.GAMEOVER:
	
	with(oBullet) instance_destroy()
	with(oEnemyBullet) instance_destroy()
	with(oParEnemy) instance_destroy()
	with(oParMovingObj) instance_destroy()
		
		var _gameOverTimer = 0;
		with(oPlayer){
			switch(global.shipIndex){
			case 0: sprite_index = sPlayer break;
			case 1: sprite_index = sPlayer2 break;
			case 2: sprite_index = sPlayer3 break;
			}
			image_index = 0
			
			var center = 128/2 + 16
			
			gameOverTimer++
			
			if gameOverTimer < 100 {
				x = lerp(x,center,0.1)
				y = lerp(y,center,0.1)
			} else 
			if gameOverTimer > 100{
				y = lerp(y,16,0.1)
				oGame.tilemapSpd = lerp(oGame.tilemapSpd,5,0.01)
			}
			
			_gameOverTimer = gameOverTimer

			if x == center && y == center{
			//	global.gameState = global.state.STAGECOMPLETE2
			}
		}
		draw_set_halign(fa_center)
		var str = "";
		var gap = 70
		var txtYY = gui_height()/2 - 180
			if _gameOverTimer > 100 {
				str = $"health: {global.hp.current}";
				draw_text(gui_width()/2 - string_length(str),txtYY,str)
			}
			if _gameOverTimer > 125 {
				str = $"accuracy: {global.accuracy}%";
				draw_text(gui_width()/2 - string_length(str),txtYY + gap,str)
			}
			if _gameOverTimer > 150 {
				str = $"score: {global.score}";
				draw_text(gui_width()/2 - string_length(str),txtYY + gap * 2,str)
			}
			if _gameOverTimer > 175{
				str = $"time: {global.time}";
				draw_text(gui_width()/2 - string_length(str),txtYY + gap * 3,str)
			}
			if _gameOverTimer > 200{
				str = $"ship: {global.ship[global.shipIndex].name}";
				draw_text(gui_width()/2 - string_length(str),txtYY + gap * 4,str)
			}

			
			if _gameOverTimer > 225{
				draw_sprite_ext(sReplay,0,60,txtYY + gap * 6.5,4,4,0,c_white,1)
				draw_sprite_ext(sContinue,0,490,txtYY + gap * 6.5,4,4,0,c_white,1)
				
				if gameOverIndex == 0 {
					draw_sprite_ext(sContinue,1,490,txtYY + gap * 6.5,4,4,0,c_white,1)
				} else {
					draw_sprite_ext(sReplay,1,60,txtYY + gap * 6.5,4,4,0,c_white,1)
				}
			}
			if _gameOverTimer > 100{
					logoy = lerp(logoy, 160,0.01)
					emitterY = lerp(emitterY,16,0.01)
			}
			
			draw_set_halign(fa_left)
			indexTimer ++
			
			part_emitter_region(PS2, explosionEmtter, 128/2 - 20, 128/2 - 10 , emitterY, emitterY+5, ps_shape_ellipse, ps_distr_gaussian);
			part_type_sprite(p2,sGameover,0,0,0)
			part_type_subimage(p2, explosionFrame);
			part_emitter_stream(PS2,explosionEmtter,p2,1)
			draw_sprite_ext(sGameover,0,gui_width()/2 - 86 * 3 ,logoy ,6,6,0,cw,1)
		
			if instance_exists(oPlayer){
				if btn.b and _gameOverTimer >= 560 {
				
				global.freezeGame = false
				
					if part_system_exists(PS2)
						part_system_destroy(PS2);
					
					with(oPlayer) 
						instance_destroy();
					
					global.round = 0
					oGame.tilemapSpd = 0.3
					//replay
					if gameOverIndex == 1 {
						RoomGoto(rmLevel1)
					}
					//continue
					else if gameOverIndex == 0 {
						RoomGoto(rmMainMenu)
					}
					global.gameState = global.state.PHASE1
					}
			}
			
			var haxis = gamepad_axis_value(0, gp_axislh);
			var vaxis = gamepad_axis_value(0, gp_axislv);

			if haxis < -0.5 btn.left = true
			else if haxis > 0.5 btn.right = true
			
			if _gameOverTimer >= 560 {
				if btn.left gameOverIndex = 1
				if btn.right gameOverIndex = 0
			}
			
	break;
}

if keyboard_check_pressed(vk_left){
	global.gameState = global.state.STAGECOMPLETE	
}


draw_set_halign(fa_left)