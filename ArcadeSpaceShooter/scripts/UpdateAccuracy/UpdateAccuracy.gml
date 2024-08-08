// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function UpdateAccuracy(isHit){
	global.totalShots ++
	if isHit {
		global.hits++	
	}
	global.accuracy = (global.hits/global.totalShots) * 100
	return global.accuracy 
}