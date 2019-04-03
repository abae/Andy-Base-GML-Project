x = 0;
y = 0;
gui_width = display_get_gui_width();
gui_height = display_get_gui_height();
gui_margin = 32;

menu_x = room_width/2;
menu_y = 600;
menu_speed = 25; 
menu_font = fnt_pixel48;
menu_itemheight = font_get_size(menu_font);
menu_committed = -1;
menu_control = true;

menu[2] = "Start";
menu[1] = "Credits";
menu[0] = "Quit";

menu_items = array_length_1d(menu);
menu_cursor = array_length_1d(menu)-1;
menu_top = menu_y - ((menu_itemheight * 1.5) * menu_items);

//credits screen
credits = false;
