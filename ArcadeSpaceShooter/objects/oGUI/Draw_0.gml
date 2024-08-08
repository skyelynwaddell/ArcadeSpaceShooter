		if !instance_exists(oPlayer) return;
		
		if oPlayer.gameOverTimer > 1 {
			
			with(oShadow) instance_destroy();
		with(oPlayer){
							if part_system_exists(PS1)
							part_system_destroy(PS1)
								
							if part_system_exists(PS2)
							part_system_destroy(PS2)
							
							if part_system_exists(PS3)
							part_system_destroy(PS3)
							
							if part_system_exists(PS4)
							part_system_destroy(PS4)
						}
		}
						
		if oPlayer.gameOverTimer > 100 {
				oPlayer.gameOverAlpha += 0.01
				var _c = c_black
				draw_set_alpha(oPlayer.gameOverAlpha)
				with(oCloud){
					image_alpha -= 1
				}
				with(oPlayer){
					image_alpha -= 0.01
					
				}
				draw_rectangle_color(0,0,1024,1024,_c,_c,_c,_c,0)
				draw_set_alpha(1)
			}