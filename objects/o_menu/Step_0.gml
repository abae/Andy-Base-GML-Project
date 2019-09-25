//get player input
if (menu_control){
	//keyboard control of menu
	if (global.pUp){
		menu_cursor++;
		if (menu_cursor >= menu_items) menu_cursor = 0;
	}
	if (global.pDown){
		menu_cursor--;
		if (menu_cursor < 0) menu_cursor = menu_items - 1;
	}
	if (global.pSELECT){
		menu_committed = menu_cursor;
		menu_control = false;
	}		
	
	//mouse control of menu
	if ((mouse_y < menu_y) and (mouse_y > menu_top) and (between(mouse_x,menu_x - GUIWIDTH/6,menu_x + GUIWIDTH/6))){
		menu_cursor = (menu_y - mouse_y) div (menu_itemheight * 1.5);
		if (global.pMBLeft){
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