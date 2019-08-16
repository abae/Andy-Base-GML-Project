//Setting up camera
target_view = 0;
cam = view_camera[target_view];
if (instance_exists(o_player)) follow = o_player;
else {
    follow = -1;
    follow_x = room_width/2;
    follow_y = room_height/2;
}
orig_view_w = camera_get_view_width(cam);
view_w_half = camera_get_view_width(cam)/2;
orig_view_h = camera_get_view_height(cam);
view_h_half = camera_get_view_height(cam)/2;
xTo = xstart;
yTo = ystart;

//screen shake
shake_length = 0;
shake_magnitude = 0;
shake_remain = 0;
buff = 0;

//zoom and move
zoom = 1;

//interpolation rate
zoom_rate = .05;
move_rate = .1;

//set camera
camera_set_view_size(cam, zoom * orig_view_w, zoom * orig_view_h);