//if (live_call()) return live_result;

#region //Player input
//Get player input
key_right =				keyboard_check(ord("D")) or keyboard_check(vk_right);
key_right_pressed =		keyboard_check_pressed(ord("D")) or keyboard_check_pressed(vk_right);
key_left =				keyboard_check(ord("A")) or keyboard_check(vk_left);
key_left_pressed =		keyboard_check_pressed(ord("A")) or keyboard_check_pressed(vk_left);
key_up =				keyboard_check(ord("W")) or keyboard_check(vk_up);
key_up_pressed =		keyboard_check_pressed(ord("W")) or keyboard_check_pressed(vk_up);
key_down =				keyboard_check(ord("S")) or keyboard_check(vk_down);
key_down_pressed =		keyboard_check_pressed(ord("S")) or keyboard_check_pressed(vk_up);
key_jump =				keyboard_check_pressed(vk_space);
key_jump_released =     keyboard_check_released(vk_space);
key_jump_held =			keyboard_check(vk_space);
#endregion

//Finite state machine ////////////////////////////////////////////////////////
switch (state){
	case states.normal: {
		#region //horizontal movement
		if (grounded){
			vx = approach(vx,movespeed*(key_right-key_left),accel);
			//dust
			if (vx != 0 and sign(vx) != sign(vx_prev) and !nexttowall){
				emit_dust(5,x,bbox_bottom,-sign(vx)*.5,-sign(vx)*2,-.5,0,depth-1,c_white);
			}
			if (abs(vx) >= movespeed/2) dust_buffer--;
			else dust_buffer = random_range(20,30);
			if (dust_buffer <= 0){
				emit_dust(2,x,bbox_bottom,-sign(vx)*.5,-sign(vx)*2,-.5,0,depth-1,c_white);
				dust_buffer = random_range(20,30);
			}
			//forgiveness mechanic
			canjump = jump_buffer;
		}else{
			if (key_right and vx <= movespeed) vx = approach(vx,movespeed,air_accel);
			if (key_left and vx >= -movespeed) vx = approach(vx,-movespeed,air_accel); 
			canjump--;
		}
		#endregion
		#region //jumping
		if (key_jump and canjump>0){
		    vy = -jumpspeed;
		    xscale = 0.6;
		    yscale = 1.5;
			////audio_play_sound(sfx_jump,5,false);
		}
		if (!grounded) {
		    vy = approach(vy,vterm,grav);
			if (!key_jump_held) vy = approach(vy,vterm, vari_jump_accel);
			//stretch
			if (vy>0){
    			xscale = 1-.15*(abs(vy/vterm));
    			yscale = 1+.15*(abs(vy/vterm));
			}
		}
		#endregion
		
		#region //switching states
		//dead
		if (global.hp == 0) state = states.dead;
		#endregion
	}break;
	case states.dead: {
		if (grounded) vx = approach(vx, 0, accel);
		vy = approach(vy,vterm,grav);
		
		transition("fade",TRANS_MODE.RRESTART);
	}break;
}

/// sprite adjustment /////////////////////////////////////////////////////////
xscale = approach(xscale, 1, 0.05);
yscale = approach(yscale, 1, 0.05);
if (vx!=0) facing = sign(vx);