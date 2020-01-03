application_surface_draw_enable(false);

aspect			= camera_get_view_width(view_camera[0]) / camera_get_view_height(view_camera[0]);
u_fx_strength	= shader_get_uniform(shd_distortion_normals, "fx_strength");
u_aspect		= shader_get_uniform(shd_distortion_normals, "aspect");
u_aberration	= shader_get_uniform(shd_distortion_normals, "aberration");
u_tex_waves		= shader_get_sampler_index(shd_distortion_normals, "tex_waves");

nausea = false;
u_nauscol		= shader_get_uniform(shd_hue,"Position");
u_nauspos		= shader_get_uniform(shd_rad_blur,"pos");
u_nausinten		= shader_get_uniform(shd_rad_blur,"intensity");

shadernum = 0;