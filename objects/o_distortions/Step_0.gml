/// @description get clicks / wave age

// WAVE BIRTH
//-----------------------------------------------------------------------------
// create a wave on mouse-click
//if (device_mouse_check_button_pressed(0, mb_left)) {
//	var new_wave = ds_list_create();
//	new_wave[|waveparam.xx]		= mouse_x;
//	new_wave[|waveparam.yy]		= mouse_y;
//	new_wave[|waveparam.age]	= 0;
//	new_wave[|waveparam.scale]	= 2;
//	new_wave[|waveparam.alpha]	= .8;

//	ds_list_add(list_of_waves, new_wave);
//}

// WAVE AGE:
//-----------------------------------------------------------------------------
var wave_list_size = ds_list_size(list_of_waves);
if (wave_list_size > 0) {
	var w, this_wave;
	for (w = 0; w < wave_list_size; w++) {
		this_wave = list_of_waves[|w];
		this_wave[|waveparam.age]	+= this_wave[|waveparam.agerate];
		if (this_wave[|waveparam.inst] != noone){
			this_wave[|waveparam.xx] = this_wave[|waveparam.inst].x;
			this_wave[|waveparam.yy] = this_wave[|waveparam.inst].y;
		}
		
		if (this_wave[|waveparam.age] < wave_life) {
			if (this_wave[|waveparam.agerate]!=0){
				this_wave[|waveparam.scale]	= tween_cubic_out_simple(this_wave[|waveparam.age] / wave_life) * wave_scale_max;
				this_wave[|waveparam.alpha]	= 1 - tween_quadratic_out_simple(this_wave[|waveparam.age] / wave_life);
			}
		} else {
			ds_list_destroy(this_wave);
			ds_list_delete(list_of_waves, w);
			w--;
			wave_list_size--;
		}
	}
}