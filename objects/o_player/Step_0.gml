//if (live_call()) return live_result;

#region //Player input
//Get player input
key_right =				keyboard_check(ord("D")) || keyboard_check(vk_right);
key_right_pressed =		keyboard_check_pressed(ord("D")) || keyboard_check_pressed(vk_right);
key_left =				keyboard_check(ord("A")) || keyboard_check(vk_left);
key_left_pressed =		keyboard_check_pressed(ord("A")) || keyboard_check_pressed(vk_left);
key_up =				keyboard_check(ord("W")) || keyboard_check(vk_up);
key_up_pressed =		keyboard_check_pressed(ord("W")) || keyboard_check_pressed(vk_up);
key_down =				keyboard_check(ord("S")) || keyboard_check(vk_down);
key_down_pressed =		keyboard_check_pressed(ord("S")) || keyboard_check_pressed(vk_up);
key_jump =				keyboard_check_pressed(vk_space);
key_jump_held =			keyboard_check(vk_space);
#endregion

vx = (key_right-key_left)*movespeed;
vy = (key_down-key_up)*movespeed;

