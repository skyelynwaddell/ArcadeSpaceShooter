if y < 0 return;

global.accuracy = UpdateAccuracy(true)

hp -= other.pow;
instance_destroy(other);
global.score += 10
miniExplosion = true
miniExplosionTiime = 0
ScreenShake(10,3);
if hp<=0 and !explosion {
	visible = false
	explosion = true
	explosionTime = 0
	call_later(5, time_source_units_seconds, DestroyParticles)

}
hitmarker = 5