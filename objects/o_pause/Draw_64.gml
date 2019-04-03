if (pause)
{
	draw_set_color(c_black);
	draw_rectangle(0,0,view_wport[0], view_hport[0],0);
	draw_set_halign(fa_center);
	//draw_set_font();
	draw_set_color(c_white);
	draw_text(view_wport[0]/2, view_hport[0]/2 - 200,"PAUSED");
	//draw_set_font();
	draw_text(view_wport[0]/2, view_hport[0]/2 + 200,"Press ESC to continue");
	draw_text(view_wport[0]/2, view_hport[0]/2 + 300,"Press BACKSPACE to exit to main menu");
}

