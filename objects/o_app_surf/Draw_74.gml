ping = surface_create(surface_get_width(application_surface), surface_get_height(application_surface));
pong = surface_create(surface_get_width(application_surface), surface_get_height(application_surface));

if (instance_exists(o_distortions)){
	if (ds_list_size(o_distortions.list_of_waves) > 0){
		
		gpu_set_texfilter(false);
		app_surf_shader_set(shd_distortion_normals);
		shader_set_uniform_f(u_fx_strength, .1);
		shader_set_uniform_f(u_aspect, aspect);
		shader_set_uniform_f(u_aberration, 0);
		texture_set_stage(u_tex_waves, o_distortions.tex_waves);
	
		gpu_set_texfilter(false);
	}
}

if (nausea) {
	app_surf_shader_set(shd_hue);
	shader_set_uniform_f(u_nauscol,(current_time/5700)-floor(current_time/5700));
	
	app_surf_shader_set(shd_rad_blur);
	var blurxx = wave(-50,50,1.2,0);
	var bluryy = wave(-50,50,1.2,.25);
    shader_set_uniform_f(u_nauspos,(o_player.x + blurxx - o_camera.x+GUIWIDTH/2)/GUIWIDTH,(o_player.y + bluryy - o_camera.y + GUIHEIGHT/2)/GUIHEIGHT);
	shader_set_uniform_f(u_nausinten,wave(.5,.9,1.9,1));
}
if (shadernum == 0){
	draw_surface(application_surface,0,0);
}else if (shadernum == 1){
	draw_surface(application_surface,0,0);
	shader_reset();
	surface_reset_target();
	draw_surface(ping,0,0);
}else if (shadernum%2 == 0){
	draw_surface(ping,0,0);
	shader_reset();
	surface_reset_target();
	draw_surface(pong,0,0);
}else{
	draw_surface(pong,0,0);
	shader_reset();
	surface_reset_target();
	draw_surface(ping,0,0);
}

surface_free(ping);
surface_free(pong);
shadernum = 0;