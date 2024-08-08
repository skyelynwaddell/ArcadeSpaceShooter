/// @description Insert description here
// You can write your code in this editor
if instance_exists(oPlayer)
{
	if distance_to_object(oPlayer) > 300 {
		global.accuracy = UpdateAccuracy(false)
		instance_destroy(id)
	}
}



if global.freezeGame {
	speed = 0
} else speed = defaultSpd;