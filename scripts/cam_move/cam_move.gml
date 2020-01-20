///@desc cam_move(x,y,zoom)
///@arg x
///@arg y
///@arg zoom

with (o_camera){
    follow_x = argument0 - (zoom*origView_w)/2;
    follow_y = argument1 - (zoom*origView_h)/2;
    zoom = argument2;
    camera_set_view_size(cam, zoom*origView_w, zoom*origView_h);
    camera_set_view_pos(cam, argument0 - (zoom*origView_w)/2, argument1 - (zoom*origView_h)/2);
}