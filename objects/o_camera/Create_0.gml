//Setting up camera
targetView = 0;
cam = view_camera[targetView];
if (instance_exists(o_player)) follow = o_player;
else {
    follow = -1;
    follow_x = xstart;
    follow_y = ystart;
}
origView_w = camera_get_view_width(cam);
halfView_w = camera_get_view_width(cam)/2;
origView_h = camera_get_view_height(cam);
halfView_h = camera_get_view_height(cam)/2;
xTo = xstart;
yTo = ystart;

//screen shake
shakeLength = 0;
shakeMagnitude = 0;
shakeRemain = 0;
buff = 0;

//zoom and move
origzoom = 1/3;
zoom = origzoom;

//interpolation rate
zoomRate = .05;
moveRate = .1;

//set camera
camera_set_view_size(cam, zoom * origView_w, zoom * origView_h);