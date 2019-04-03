dev = true;

#macro TILE_SIZE 16

resolution_set();

global.cutscene = false;
global.transition_type = "fade";


if(dev)
{
	show_debug_overlay(true);
}
else
{
	window_set_fullscreen(true);
}

room_goto_next();