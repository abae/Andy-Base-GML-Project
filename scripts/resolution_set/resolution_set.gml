//resolution variables
idealWidth = 0;
idealHeight = 1080;


aspectRatio = 16/9;
//if (dev) aspectRatio = 16/9;
//else aspectRatio = display_get_width()/display_get_height();

idealWidth = round(idealHeight*aspectRatio);

//Pixel perfect scale
if (!dev){
	if (display_get_width() mod idealWidth != 0){
	    var d = round(display_get_width()/idealWidth);
	    idealWidth = display_get_width()/d;
	}
	if (display_get_height() mod idealHeight != 0){
	    var d = round(display_get_height()/idealHeight);
	    idealHeight = display_get_height()/d;
	}
	if (idealWidth & 1) idealWidth++;
	if (idealHeight & 1) idealHeight++;
}

globalvar GUIWIDTH, GUIHEIGHT;
GUIWIDTH = idealWidth;
GUIHEIGHT =	idealHeight;

for(var i=1; i<=room_last; i++;)
{
    if (room_exists(i))
    {
        room_set_view(i,0,true,0,0,idealWidth,idealHeight,0,0,idealWidth,idealHeight,0,0,noone);
        room_set_view_enabled(i,true);
    }
}
surface_resize(application_surface,idealWidth,idealHeight);
display_set_gui_size(idealWidth,idealHeight);
window_set_size(idealWidth,idealHeight);
//window_set_position((display_get_width()-idealWidth)/2,(display_get_height()-idealHeight)/2);