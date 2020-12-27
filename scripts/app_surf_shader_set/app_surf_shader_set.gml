/// @param shd
var shd = argument0;

if (shadernum == 0){
	surface_set_target(ping);
}else if (shadernum == 1){
	draw_surface(application_surface,0,0);
	shader_reset();
	surface_reset_target();
	surface_set_target(pong);
}else if (shadernum%2 == 0){
	draw_surface(ping,0,0);
	shader_reset();
	surface_reset_target();
	surface_set_target(ping);
}else if (shadernum%2 == 1){
	draw_surface(pong,0,0);
	shader_reset();
	surface_reset_target();
	surface_set_target(pong);
}
shader_set(shd);

shadernum++;