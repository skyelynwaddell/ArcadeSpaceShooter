function SetAllTilemapsInvisible(){
	for (var i=0; i < array_length(mapSegs); i++){
		var mapSeg =  $"Tileset{mapSegs[i]}"
		var _layer = layer_get_id(mapSeg)
		layer_set_visible(_layer,false)
	}
}