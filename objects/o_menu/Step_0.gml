//get player input
if (menu_control)
{
	//keyboard control of menu
	if (keyboard_check_pressed(vk_up) || keyboard_check_pressed(ord("W")))
	{
		menu_cursor++;
		if (menu_cursor >= menu_items) menu_cursor = 0;
	}
	if (keyboard_check_pressed(vk_down) || keyboard_check_pressed(ord("S")))
	{
		menu_cursor--;
		if (menu_cursor < 0) menu_cursor = menu_items - 1;
	}
	if (keyboard_check_pressed(vk_enter) || keyboard_check_pressed(vk_space))
	{
		menu_committed = menu_cursor;
		menu_control = false;
	}		
	
	//mouse control of menu
	var mouse_x_gui = device_mouse_x_to_gui(0);
	var mouse_y_gui = device_mouse_y_to_gui(0);
	if ((mouse_y_gui < menu_y) && (mouse_y_gui > menu_top) && (between(mouse_x_gui,menu_x - gui_width/6,menu_x + gui_width/6)))
	{
		menu_cursor = (menu_y - mouse_y_gui) div (menu_itemheight * 1.5);
		if (mouse_check_button_pressed(mb_left))
		{
			menu_committed = menu_cursor;
			menu_control = false;
		}
	}
}

if (menu_committed != -1)
{
	switch (menu_committed)
	{
		case 2: default:
			{
				transition("slide",TRANS_MODE.GOTO,rm_test);
				audio_stop_all();
			}
			break;
		case 1: 
			{
				credits = true; 
				menu_control = false;
				break;
			}
		case 0: game_end(); break;
	}
}