event_inherited();

var set = array_create(3);

image_angle = (image_angle div 90)*90;

if (image_angle = 0)
{
	set[0] = [bbox_left, bbox_top-1];
	set[1] = [bbox_right+2, bbox_bottom+1];
	set[2] = [bbox_left, bbox_bottom+1];
}
else if (image_angle = 90)
{
	set[0] = [bbox_right+1, bbox_top];
	set[1] = [bbox_right+1, bbox_bottom+1];
	set[2] = [bbox_left, bbox_bottom+1];
}
else if (image_angle = 180)
{
	set[0] = [bbox_left, bbox_top];
	set[1] = [bbox_right+1, bbox_top];
	set[2] = [bbox_right+1, bbox_bottom+1];
}
else if (image_angle = 270)
{
	set[0] = [bbox_left, bbox_top];
	set[1] = [bbox_right+2, bbox_top];
	set[2] = [bbox_left, bbox_bottom+2];
}
else instance_destroy(id)

polygon = polygon_create(set);