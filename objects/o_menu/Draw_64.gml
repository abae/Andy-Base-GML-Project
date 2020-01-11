switch (state){
    case menu_states.normal:{
        set_text(c_white,fnt_pixel48,fa_center,fa_middle);
    	draw_text(room_width/2,80,"SAMPLE TITLE");
    	draw_set_font(menuFont);
    
    	for (var i = 0; i < menuItems; i++){
    		draw_set_valign(fa_bottom);
    		var offset = 2;
    		var txt = menu[i];
    		if (menuCursor == i){
    			var col = c_white;
    		}else{
    			var col = c_gray;
    		}
    		var xx = menu_x;
    		var yy = menu_y - (menuItemHeight*(i*1.5));
    		draw_set_color(c_black);
    	    draw_shadowtext(xx,yy,txt,.8,.8,0,col,1);
    	}
    }break;
    case menu_states.credits:{
    	set_text(c_white,fnt_pixel48,fa_center,fa_middle)
    	draw_text(room_width/2,50,"CREDITS");
    	draw_set_font(fnt_pixel32);
        draw_shadowtext(room_width/2,220,"Lead Dev: Andy Bae\n@Bae_Yusung\n\n\n\nPress ESC to exit to menu",.8,.8,0,c_white,1);
    }break;
    case menu_states.howto:{
		set_text(c_white,fnt_pixel48,fa_right,fa_middle)
		draw_shadowtext(room_width/2+270,50,"How to Play",1,1,0,c_white,1);
		draw_set_font(fnt_pixel32);
		draw_set_halign(fa_right)
		draw_shadowtext(room_width/2+270,220,"ba baba\n baba ba baba",.45,.45,0,c_white,1);
	}break;
	default: break;
}
