if (!credits)
{
	set_text(c_white,fnt_pixel96,fa_center,fa_middle);
	draw_text(room_width/2,200,"SAMPLE TITLE");
	draw_set_font(fnt_pixel48);

	for (var i = 0; i < menu_items; i++)
	{
		draw_set_valign(fa_bottom);
		var offset = 2;
		var txt = menu[i];
		if (menu_cursor == i)
		{
			var col = c_white;
		}
		else
		{
			var col = c_gray;
		}
		var xx = menu_x;
		var yy = menu_y - (menu_itemheight*(i*1.5));
		draw_set_color(c_black);
		draw_text(xx-offset,yy,txt);
		draw_text(xx+offset,yy,txt);
		draw_text(xx,yy-offset,txt);
		draw_text(xx,yy+offset,txt);
		draw_set_color(col);
		draw_text(xx,yy,txt);
	}
}
else
{
	set_text(c_white,fnt_pixel96,fa_center,fa_middle)
	draw_text(room_width/2,100,"CREDITS");
	draw_set_font(fnt_pixel48);
	draw_text(room_width/2,350,"Lead Dev:\nAndy Bae\n\nPress ESC to go back to the main menu");
}
