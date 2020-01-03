sprite			= s_spirit; //_256

shader			= shd_distortion_normals;
aspect			= camera_get_view_width(view_camera[0]) / camera_get_view_height(view_camera[0]);
tex_waves		= -1;

// wave parameters:
wave_life		= 1.5 * game_get_speed(gamespeed_fps);	// life in seconds
wave_scale_max	= 1600 / sprite_get_width(sprite);		// size in pixels in room space
enum waveparam {inst, xx, yy, age, agerate, scale, alpha}				// should be in unreferenced script rather

// create waves list which will hold lists for each active wave.
// those lists will be created in step event on click
// and will age and be deleted in step event as well
list_of_waves	= ds_list_create();

// prepare waves surface
srf_waves		= -1;
srf_waves_scale	= 1/4;
view_w			= camera_get_view_width(view_camera[0]);
view_h			= camera_get_view_height(view_camera[0]);

// turn off automatic drawing of the application surface:
application_surface_draw_enable(false);

debug = false;
