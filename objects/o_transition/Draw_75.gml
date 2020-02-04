/// @description Black bars

if (mode != TRANS_MODE.OFF){
	switch (global.transition_type){
		case "slide": default:{
			draw_set_color(c_black);
			draw_rectangle(0,0,w,percent*h_half,false);
			draw_rectangle(0,h,w,h-(percent*h_half),false);
		}break;
		case "fade":{
			draw_sprite_ext(s_pixel,0,0,0,w,h,0,c_black,percent);
		}break;
		case "invcircle":{
			var surf = surface_create(GUIWIDTH,GUIHEIGHT);
			surface_set_target(surf);
			draw_set_color(c_black);
			draw_rectangle(0,0,GUIWIDTH,GUIHEIGHT,false);
			gpu_set_blendmode(bm_subtract);
			draw_set_color(c_white);
			draw_set_circle_precision(64);
			draw_circle(GUIWIDTH/2,GUIHEIGHT/2,(1-percent)*sqrt(sqr(GUIWIDTH/2)+sqr(GUIHEIGHT/2)),false);
			gpu_set_blendmode(bm_normal);
			surface_reset_target();
			draw_surface(surf,0,0);
			surface_free(surf);
		}break;
	}
}

