if (dev)
{
	if (is(room_get_name(room),"rm_splash","rm_menu")) room_goto_next();
	
	if (keyboard_check(vk_control))
	{
		if (keyboard_check_pressed(ord("R"))) game_restart();
		if (keyboard_check_pressed(ord("P")) and room_next(room) != -1) room_goto_next();
		if (keyboard_check_pressed(ord("O")) and room_previous(room) != -1) room_goto_previous();
	
		//fullscreen switching
		if (keyboard_check_pressed(ord("F"))) window_set_fullscreen(!window_get_fullscreen());
	}
}