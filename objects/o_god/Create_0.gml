dev = true;
devDraw = false;

paused = false;
screenshot = -1;


scribble_init("fonts","fnt_pixel16",true);
resolution_set();
randomize();

global.cutscene = false;
global.transition_type = "fade";


if(dev){
	show_debug_overlay(true);
	window_set_size(idealHeight*2,idealHeight*2);
	alarm[0] = 1; //center window
}else{
	window_set_fullscreen(true);
}

room_goto_next();
