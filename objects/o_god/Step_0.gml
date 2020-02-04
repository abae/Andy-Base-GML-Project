//developer tools
if (dev){
	if (is(room_get_name(room),"rm_splash","rm_menu")) room_goto_next();
	
	if (keyboard_check(vk_control)){
		if (keyboard_check_pressed(ord("R"))) game_restart();
		if (keyboard_check_pressed(ord("P")) and room_next(room) != -1) room_goto_next();
		if (keyboard_check_pressed(ord("O")) and room_previous(room) != -1) room_goto_previous();
		if (keyboard_check_pressed(ord("D"))) devDraw = !devDraw;
	
		//fullscreen switching
		if (keyboard_check_pressed(ord("F"))) window_set_fullscreen(!window_get_fullscreen());
	}
}

//Pausing
if (keyboard_check_pressed(vk_escape) and !is(room,rm_init,rm_splash,rm_menu)){
    paused = !paused
    if (!sprite_exists(screenshot)) screenshot = sprite_create_from_surface(application_surface,0,0,view_wport,view_hport,0,0,0,0);
    
    if (paused){
        instance_deactivate_all(true);
    }else{
        if (sprite_exists(screenshot)) sprite_delete(screenshot);
        instance_activate_all();
    }
}
//pause options
if (paused){
	if(keyboard_check_pressed(ord("R"))){
		paused = !paused
		if (sprite_exists(screenshot)) sprite_delete(screenshot);
        instance_activate_all();
		transition("slide",TRANS_MODE.RRESTART);
	}
	if(keyboard_check_pressed(ord("X"))){
		paused = !paused
		if (sprite_exists(screenshot)) sprite_delete(screenshot);
        instance_activate_all();
		transition("fade",TRANS_MODE.GOTO,rm_menu);
	}
}

//clamp mouse position
if (window_has_focus()) display_mouse_lock(0, 0, display_get_width(),display_get_height());
else display_mouse_unlock();