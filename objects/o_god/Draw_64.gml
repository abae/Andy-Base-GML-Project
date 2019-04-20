/// @desc 
set_text(c_white,fnt_pixel48,fa_center,fa_middle);

if (paused){
    draw_sprite_ext(screenshot,0,0,0,1,1,0,c_white,1);
    draw_text(GUIWIDTH/2,GUIHEIGHT/2,"PAUSED");
}