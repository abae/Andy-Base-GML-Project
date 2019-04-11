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
switch (state)
{
	case states.normal: 
	{
		#region //normal
			#region //horizontal movement
			if (grounded)
			{
				vx = approach(vx,movespeed*(key_right-key_left),accel);
				canjump = jump_buffer; //forgiveness mechanic
			}
			else
			{
				if (key_right and vx <= movespeed) vx = approach(vx,movespeed,air_accel);
				if (key_left and vx >= -movespeed) vx = approach(vx,-movespeed,air_accel); 
				canjump--;
			}
			#endregion
			
			#region //jumping

			if (key_jump and canjump>0)
			{
			    vy = -jumpspeed;
				////audio_play_sound(sfx_jump,5,false);
			}
			if (!grounded) 
			{
			    vy = approach(vy,vterm,grav);
    			if (!key_jump_held) vy = approach(vy,vterm, vari_jump_accel);
			}
			#endregion
			
			#region //switching states
			//dead
			if (global.hp == 0) state = states.dead;
			#endregion
			
		#endregion
	}
	break;
	case states.dead: 
	{
		#region //dead
		if (grounded) vx = approach(vx, 0, accel);
		vy = approach(vy,vterm,grav);
		
		transition("fade",TRANS_MODE.RRESTART);
		#endregion
	}
	break;
}

/// sprite adjustment /////////////////////////////////////////////////////////
xscale = approach(xscale, 1, 0.05);
yscale = approach(yscale, 1, 0.05);
if (vx!=0) facing = sign(vx);