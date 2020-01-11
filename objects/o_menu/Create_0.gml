x = 0;
y = 0;
guiMargin = 32;

menu_x = room_width/2;
menu_y = 350;
menuFont = fnt_pixel32;
menuItemHeight = font_get_size(menuFont);
menuCommitted = -1;
menuControl = true;

menu[3] = "Start";
menu[2] = "How to Play";
menu[1] = "Credits";
menu[0] = "Quit";

enum menu_states{
	normal,
	credits,
	howto,
	leaderboards
}
state = menu_states.normal;

menuItems = array_length_1d(menu);
menuCursor = array_length_1d(menu)-1;
menuTop = menu_y - ((menuItemHeight * 1.5) * menuItems);
