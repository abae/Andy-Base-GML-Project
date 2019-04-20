dev = true;
paused = false;
screenshot = -1;

#macro TILE_SIZE 16

resolution_set();

global.cutscene = false;
global.transition_type = "fade";


if(dev)
{
	show_debug_overlay(true);
	window_set_size(ideal_width*2,ideal_height*2);
	alarm[0] = 1; //center window
}
else
{
	window_set_fullscreen(true);
}

room_goto_next();
