draw_sprite(s_player,0,tween_cubic_out_in_ext(timer,120,0,100,300),50);
draw_sprite(s_player,0,100+(tween_bounce_out_simple((120-timer)/120)*200),100);
draw_sprite(s_player,0,100+(tween_sinusodial_out_in_simple((120-timer)/120)*200),150);
draw_sprite(s_player,0,100+(tween_quadratic_in_simple((120-timer)/120)*200),200);
draw_sprite(s_player,0,100+(tween_anticipate_overshoot_simple((120-timer)/120,2)*200),250);
draw_sprite(s_player,0,100+(tween_anticipate_simple((120-timer)/120,2)*200),300);
draw_sprite(s_player,0,100+(tween_elastic_out_simple((120-timer)/120,1)*200),350);


//set_text(c_white,fnt_pixel16,fa_left,fa_middle);
//scribble_draw(30,30,"This is some test of the new [c_yellow]text stuff[/c] that\nI am trying out, [rainbow][wave]this is really cool[/wave][/rainbow]")