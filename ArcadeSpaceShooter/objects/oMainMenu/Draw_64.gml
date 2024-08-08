var ww,hh,c,gotoY, c1, cb

c = c_white
c1 = #305182
cb = c_black
ww = 10
hh = 10
gotoY = 128/2+50

print(xx)
print(yy)

draw_text(20,20,"v0.12")
InitButtons()

btn.a = gamepad_button_check_pressed(0,gp_face1)

var items = []

var haxis = gamepad_axis_value(0, gp_axislh);
var vaxis = gamepad_axis_value(0, gp_axislv);
print(haxis)

if haxis < -0.5 btn.left = true
else if haxis > 0.5 btn.right = true

if vaxis < -0.5 btn.up = true
else if vaxis > 0.5 btn.down = true

var moveagain = function() { canmove = true }



switch(state){
	case "main":
	
	if btn.a {
		global.gameState = global.state.STARTMENU
		RoomGoto(rmLevel1)	
	}
	
	var xx2 = gui_width()/2 
	var yy2 = gui_height()/2 - hh + 200
	draw_set_halign(fa_center)
	draw_text(xx2-00,yy+795,"(c) skyescloud 2024")

if canmove{
if btn.up {
	
	index--
	if index < 0 index = array_length(items)
	canmove = false
	call_later(10,time_source_units_frames,moveagain)
	lerpScale = 5
}
if btn.down {
	
	index++
	if index == array_length(items) index = 0 
	canmove = false
	call_later(10,time_source_units_frames,moveagain)
	lerpScale = 5
}
}
	
		items = [
			"stage select",
			"highscores",
			"settings",
		]
		draw_sprite_ext(sLogo2,0,xx,yy,ww,hh,0,c,1)
		
		for (var i=0; i<3; i++){
			var _x = xx + 128
			var _y = yy+300 + (( hh*15)*i )
			draw_set_halign(fa_center)
			draw_set_valign(fa_middle)
			draw_sprite_ext(sMainMenuButtons,i,_x,_y,5,5,0,c,1)
			lerpScale = lerp(lerpScale,5.3,0.1)
			if index == i draw_sprite_ext(sMainMenuButtons2,i,_x-17,_y-5,5.3,lerpScale,0,c,1)
			
			//draw_text_color(_x + 16*17-8, _y+42,items[i],c1,c1,c1,c1,1)
			//draw_text(_x + 16*17-8, _y+32,items[i])
			draw_set_halign(fa_left)
			draw_set_valign(fa_left)
		}
		
		if btn.b{
			goUp = !goUp
			switch(index){
				case 0 : nextState = "stage select" break;
				case 1 : nextState = "main" break;
				case 2 : nextState = "main" break;
			}
		}
		
	break;
	case "stage select":
	
	if canmove{
	if btn.up {
	
		stageIndex--
		if stageIndex < 0 stageIndex = 2
		canmove = false
		call_later(10,time_source_units_frames,moveagain)
	}
	if btn.down {
	
		stageIndex++
		if stageIndex == 3 stageIndex = 0 
		canmove = false
		call_later(10,time_source_units_frames,moveagain)
	}
	}
	
		items = [
			"stage select",
			"highscores",
			"settings",
		]
		//draw_rectangle_color(100,yy,xx+59*16-90,yy+120,cb,cb,cb,cb,0)
		//draw_text(100 + 30,yy + 30,"stage select")
		
		draw_sprite_ext(sStageSelect,stageIndex,xx+42,yy,8,8,0,c_white,1)
		
		if btn.a {
			goUp = false
			nextState = "main"
		}
		
		if btn.b{
			goUp = !goUp
			switch(stageIndex){
				case 0 : stage = "level1" break;
				case 1 : stage = "level2" break;
				case 2 : stage = "level3" break;
			}
			 nextState = "ship select" 
			 global.stage = stage
		}
	break;
	
	case "ship select":
	
			
		//ship selector
		draw_sprite_stretched(sShipSelector,0,xx+130,yy+380,80*8,32*8)
	
			if canmove{
			if btn.b {
				goUp = !goUp
				global.stage = stage
				nextState = "gamestart"
			}
			if btn.left {
				shipIndex--
				if shipIndex < 0 shipIndex = 2
				canmove = false
				call_later(10,time_source_units_frames,moveagain)
				global.shipIndex = shipIndex
				draw_sprite_stretched(sShipSelector,1,xx+130,yy+380,80*8,32*8)
			}
			if btn.right {
				shipIndex++
				if shipIndex > 2 shipIndex = 0 
				canmove = false
				call_later(10,time_source_units_frames,moveagain)
				global.shipIndex = shipIndex
				draw_sprite_stretched(sShipSelector,2,xx+130,yy+380,80*8,32*8)
			}
		}
		
		if btn.a {
			goUp = false
			nextState = "stage select"
		}

		
		var shipDescription = ""
		shipDescription = $"{global.ship[shipIndex].name}  \n" +
										 $"power:   {global.ship[shipIndex].pow} \n" +
										 $"defense: {global.ship[shipIndex].def} \n" +
										 $"speed:   {global.ship[shipIndex].spd}";  

		switch(global.shipIndex){
			default:
			case 0:
				
				//draw_sprite_stretched(sPlayer,0,xx+65,yy+170,150,150)
				draw_sprite_stretched(sPlayer,0,xx+375,yy+435,150,150)
			break;
			case 1:
				//draw_sprite_stretched(sPlayer2,0,xx+65,yy+170,150,150)
				draw_sprite_stretched(sPlayer2,0,xx+375,yy+435,150,150)
			break;
			case 2:
				//draw_sprite_stretched(sPlayer3,0,xx+65,yy+170,150,150)
				draw_sprite_stretched(sPlayer3,0,xx+375,yy+435,150,150)
			break;
		}
		
		//top description
		draw_rectangle_color(xx+35,yy+140,xx+53.5*16,yy+350,cb,cb,cb,cb,0)
		draw_text_ext_transformed(xx+50,yy+140,shipDescription,50,1000,1,1,0)
		
				//black player select label
		draw_rectangle_color(100,yy,xx+59*16-90,yy+120,cb,cb,cb,cb,0)
		draw_text(100 + 30,yy + 30,"player select")
		
		//top ship display
		//draw_sprite_stretched(sGuiBubble3,0,xx+40,yy+150,200,200)
		
		//character display
		draw_sprite_stretched(sGuiBubbleBlack,0,xx+650,yy+145,200,200)
		draw_sprite_stretched(sCharacterSprite1,shipIndex,xx+680,yy+155,150,150)
		
		draw_sprite_stretched(sStartGame,0,xx+200,yy+685,126*4,27*4)
		//draw_sprite_stretched(sAButton,0,xx+650,yy+685,25*4,25*4)

		

	break;
	
	case "gamestart":
		RoomGoto(rmLevel1)
	break;
	
}

index = clamp(index,0,array_length(items)-1)

var spd = 0.2
if goUp{
	yy = lerp(yy,gotoY,spd)
} else  {
	canmove = false
	yy = lerp(yy,spawnY,spd)
if  yy >= 1020 {
	canmove = true
	state = nextState	
	goUp = true	
	}
}