if (dev)
{
	if (keyboard_check(vk_control))
	{
		if (keyboard_check_pressed(ord("0"))) game_restart();
		if (keyboard_check_pressed(ord("P")) && room_next(room) != -1) room_goto_next();
		if (keyboard_check_pressed(ord("O")) && room_previous(room) != -1) room_goto_previous();
		if (is(room_get_name(room),"rm_splash","rm_menu")) room_goto_next();
	
		//fullscreen switching
		if (keyboard_check_pressed(ord("F"))) window_set_fullscreen(!window_get_fullscreen());
	}
}