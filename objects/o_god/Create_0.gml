dev = true;
devDraw = false;

paused = false;
screenshot = -1;

resolution_set();
randomize();

base_size = 512;
width = browser_width;
height = browser_height;
canvas_fullscreen(base_size);

global.cutscene = false;
global.transition_type = "fade";


//if(dev){
//	show_debug_overlay(true);
//	window_set_size(idealWidth*.8,idealHeight*.8);
//	alarm[0] = 1; //center window
//}else{
//	window_set_fullscreen(true);
//}

room_goto_next();
