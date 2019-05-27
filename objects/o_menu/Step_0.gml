//get player input
if (menu_control){
	//keyboard control of menu
	if (iUP_P){
		menu_cursor++;
		if (menu_cursor >= menu_items) menu_cursor = 0;
	}
	if (iDOWN_P){
		menu_cursor--;
		if (menu_cursor < 0) menu_cursor = menu_items - 1;
	}
	if (iSELECT{
		menu_committed = menu_cursor;
		menu_control = false;
	}		
	
	//mouse control of menu
	var mouse_x_gui = device_mouse_x_to_gui(0);
	var mouse_y_gui = device_mouse_y_to_gui(0);
	if ((mouse_y_gui < menu_y) and (mouse_y_gui > menu_top) and (between(mouse_x_gui,menu_x - gui_width/6,menu_x + gui_width/6))){
		menu_cursor = (menu_y - mouse_y_gui) div (menu_itemheight * 1.5);
		if (iMB_LEFT_P){
			menu_committed = menu_cursor;
			menu_control = false;
		}
	}
}

if (menu_committed != -1){
	switch (menu_committed){
		case 3: default:{
			transition("slide",TRANS_MODE.NEXT);
			audio_stop_all();
		}break;
		case 2: {
			state = menu_states.howto;
			menu_control = false;
		}break;
		case 1: {
			state = menu_states.credits;
			menu_control = false;
			break;
		} break;
		case 0: game_end(); break;
	}
}