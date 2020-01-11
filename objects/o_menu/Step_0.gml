//get player input
if (menuControl){
	//keyboard control of menu
	if (global.pUp){
		menuCursor++;
		if (menuCursor >= menuItems) menuCursor = 0;
	}
	if (global.pDown){
		menuCursor--;
		if (menuCursor < 0) menuCursor = menuItems - 1;
	}
	if (global.pSelect){
		menuCommitted = menuCursor;
		menuControl = false;
	}		
	
	//mouse control of menu
	if ((mouse_y < menu_y) and (mouse_y > menuTop) and (between(mouse_x,menu_x - GUIWIDTH/6,menu_x + GUIWIDTH/6))){
		menuCursor = (menu_y - mouse_y) div (menuItemHeight * 1.5);
		if (global.pMBLeft){
			menuCommitted = menuCursor;
			menuControl = false;
		}
	}
}

if (menuCommitted != -1){
	switch (menuCommitted){
		case 3: default:{
			transition("slide",TRANS_MODE.NEXT);
			audio_stop_all();
		}break;
		case 2: {
			state = menu_states.howto;
			menuControl = false;
		}break;
		case 1: {
			state = menu_states.credits;
			menuControl = false;
			break;
		} break;
		case 0: game_end(); break;
	}
}