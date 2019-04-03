// Sets the resolution, then goes to the target room.
if (dev){
	dispH = 720;
	dispW = 1280;
} else{
dispH = display_get_height();
dispW = display_get_width();
}

view_height = 1024;

//else wview = max(dispW-200,960);
wh_ratio = dispW/dispH;
view_width = view_height*wh_ratio

////if os_type == os_windows
//    view_width = 640;

globalvar GUIWIDTH, GUIHEIGHT;
GUIWIDTH = view_width;
GUIHEIGHT = view_height
display_set_gui_size(view_width,view_height)
var i;
for (i = 0; i < 500; i += 1){    
    if (room_exists(i)){        
        room_set_view(i, 0, 1, 0, 0, view_width, view_height, 0, 0, view_width, view_height, -1, -1, noone)                       
    }
}
window_set_size(view_width, view_height)
window_set_position((display_get_width()-GUIWIDTH)/2,(display_get_height()-GUIHEIGHT)/2)
surface_resize(application_surface, display_get_gui_width(), display_get_gui_height()); 
