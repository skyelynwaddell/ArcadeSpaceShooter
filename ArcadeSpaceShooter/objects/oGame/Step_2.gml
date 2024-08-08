///@description Step Event
if global.freezeGame return;
if room = rmInit return;
if room = rmMainMenu return;
function UpdateTilePosition() {
	randomize();
    var totalSegments = array_length(currentLevel);
    var visibleSegments = 15; // Number of segments visible at once
    var segmentHeight = 128; // Height of each segment in pixels
	
	if keyboard_check_pressed(vk_backspace){
		game_restart()
	}
	


    // Move tilemaps down
    for (var i = 0; i < totalSegments; i++) {
        var index = currentLevel[i] - 1;
        var mapSeg = $"Tileset{mapSegs[index]}";
        var layerID = layer_get_id(mapSeg);
        var mapID = layer_tilemap_get_id(layerID);

        // Set new position
        tilemap_x(mapID, xx);
        tilemap_y(mapID, yy - segScaleY * i);
    }

    // Move entire structure down
    yy += tilemapSpd;

    // Reset position of tilemaps that moved off-screen
    if (yy >= segmentHeight * visibleSegments) {
        yy = 0;
				// Assume mapSegs and level1 are already defined
				var lastSegment = currentLevel[array_length(currentLevel) - 1];


	
        for (var i = 0; i < visibleSegments; i++) {
            var index = currentLevel[i % totalSegments] - 1; // Use modulo to loop
            var mapSeg = $"Tileset{mapSegs[index]}";
            var layerID = layer_get_id(mapSeg);
            var mapID = layer_tilemap_get_id(layerID);

            // Set new position above the current set of visible segments
            var newY = -segmentHeight * visibleSegments + segScaleY * i;
            tilemap_y(mapID, newY);
        }
    }
}

UpdateTilePosition();

InitButtons()
//if btn.up {
//tilemapSpd = lerp(tilemapSpd,0.3, 0.1)
//with(oCloud){
//	spd = lerp(spd,defaultSpd+0.3, 0.1)
//}	
//} else {
//tilemapSpd = lerp(tilemapSpd,0.2, 0.1)
//with(oCloud){
//	spd = lerp(spd,defaultSpd, 0.01)
//}	
//}

//print(global.bossFight)

part_emitter_stream(PS2,explosionEmtter,p2,1);