function ScreenShake(_duration=100,_shakeAmount=7){
	if !instance_exists(oCamera) return;
	with(oCamera){
		shakeDuration = _duration
		shakeAmount = _shakeAmount
		screenShake = shakeAmount
	}
}