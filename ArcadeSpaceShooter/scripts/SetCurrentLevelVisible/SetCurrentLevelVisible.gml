function SetCurrentLevelVisible(){
	for (var i=0; i < array_length(currentLevel); i++){
		var index = currentLevel[i] - 1
		var mapSeg =  $"Tileset{mapSegs[index]}"
		
		var _layer = layer_get_id(mapSeg)
		layer_set_visible(_layer,true)
	}
}