// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function FreezeFrame(duration=300){
			with(oPlayer){
		sprite_index = sPlayerWhite
	}
	
	global.freezeGame = true
	var unfreeze = function() { global.freezeGame = false }
	
	call_later(0.5,time_source_units_seconds,unfreeze)
	//t=current_time + duration
	//while current_time < t {
	//	//freeze the game ;)
	//}
}