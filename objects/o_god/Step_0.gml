//developer tools
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

//Pausing
if (keyboard_check_pressed(vk_escape)){
    paused = !paused
    if (!sprite_exists(screenshot)) screenshot = sprite_create_from_surface(application_surface,0,0,view_wport,view_hport,0,0,0,0);
    
    if (paused){
        instance_deactivate_all(true);
    }else{
        if (sprite_exists(screenshot)) sprite_delete(screenshot);
        instance_activate_all();
    }
}