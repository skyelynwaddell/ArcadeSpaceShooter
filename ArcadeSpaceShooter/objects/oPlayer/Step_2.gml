if gameOverTimer > 0 return;
image_blend = c_white
if damageTimer > 0 {
	depth = -12000
	image_index = 0
	if damageTimer > 75 {
		sprite_index = sPlayerWhite	
		image_blend = c_white
	}
	
	if damageTimer ==200 and sprite_index == sPlayerWhite {
		FreezeFrame(200)	
	}
	damageTimer -= 5;
	
	if damageTimer >  75 {
		image_blend = c_white
	} else if damageTimer <= 75{
		image_blend = c_white
	} else if damageTimer <= 50{
		image_blend = c_red
	} else if damageTimer <= 25{
		image_blend = c_white
		sprite_index = defaultSprite
	}
} else {
	depth = -100
	sprite_index = defaultSprite
}

if damageTimer <= 0
if btn.left or btn.right image_index = 1 else image_index = 0