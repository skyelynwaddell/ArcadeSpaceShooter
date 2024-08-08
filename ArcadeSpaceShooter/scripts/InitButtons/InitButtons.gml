function InitButtons(){
    //define buttons 
    btn = {
    left: keyboard_check(ord("A")) or gamepad_button_check(0,gp_padl),
    right: keyboard_check(ord("D"))  or gamepad_button_check(0, gp_padr),
    up: keyboard_check(ord("W" ))  or gamepad_button_check(0, gp_padu),
    down: keyboard_check(ord("S")) or gamepad_button_check(0, gp_padd),
    a: keyboard_check(vk_space) or
	gamepad_button_check(0, gp_shoulderrb) or 
	gamepad_button_check(0,gp_shoulderr) or 
	gamepad_button_check(0, gp_shoulderlb) or 
	gamepad_button_check(0,gp_shoulderl),
    b: keyboard_check_pressed(ord("F")) or gamepad_button_check_pressed(0, gp_face2),
    start: keyboard_check_pressed(vk_enter) or gamepad_button_check_pressed(0, gp_start),
    select: keyboard_check_pressed(vk_shift) or gamepad_button_check_pressed(0, gp_select)
    };
	
	btnp = {
		    up: keyboard_check_pressed(ord("W" ))  or gamepad_button_check_pressed(0, gp_padu),
		 down: keyboard_check_pressed(ord("S")) or gamepad_button_check_pressed(0, gp_padd),
	}
    return btn;
}