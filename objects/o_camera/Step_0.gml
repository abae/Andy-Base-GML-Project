//setting view values
var vpos_x = camera_get_view_x(cam);
var vpos_y = camera_get_view_y(cam);
var vpos_w = camera_get_view_width(cam);
var vpos_h = camera_get_view_height(cam);

//Updating camera
if (instance_exists(follow)){
	xTo = follow.x;
	yTo = follow.y;
}else{
    xTo = follow_x;
    yTo = follow_y;
}

#region //zoom
var new_w = lerp(vpos_w, zoom * origView_w, zoomRate);
var new_h = lerp(vpos_h, zoom * origView_h, zoomRate);

//Zoom based on size
camera_set_view_size(cam, new_w, new_h);

//Shifting camera based on zoom
var shift_x = camera_get_view_x(cam) - (new_w - vpos_w)/2;
var shift_y = camera_get_view_y(cam) - (new_h - vpos_h)/2;

//update camera
camera_set_view_pos(cam,shift_x,shift_y);
#endregion

//update view values
halfView_w = camera_get_view_width(cam)/2;
halfView_h = camera_get_view_height(cam)/2;
var vpos_x = camera_get_view_x(cam);
var vpos_y = camera_get_view_y(cam);
var vpos_w = camera_get_view_width(cam);
var vpos_h = camera_get_view_height(cam);

#region //dolly
//Movement
x = lerp(x,xTo,moveRate);
y = lerp(y,yTo,moveRate);

//Interpolate the view position to the new, relative position.
var new_x = lerp(vpos_x, x - (vpos_w/2), moveRate);
var new_y = lerp(vpos_y, y - (vpos_h/2), moveRate);

//Screen shake
x += random_range(-shakeRemain,shakeRemain);
y += random_range(-shakeRemain,shakeRemain);
shakeRemain = max(0,shakeRemain-((1/shakeLength)*shakeMagnitude));

//constrian camera
if (room_width > GUIWIDTH*zoom) x = clamp(x,halfView_w+buff,room_width-halfView_w-buff);
else new_x = (room_width-GUIWIDTH*zoom)/2;
if (room_height > GUIHEIGHT*zoom) y = clamp(y,halfView_h+buff,room_height-halfView_h-buff);
else new_y = (room_height-GUIHEIGHT*zoom)/2;

//Update the view position
camera_set_view_pos(cam, new_x, new_y);
#endregion
