//if (live_call()) return live_result;
// if (key_right-key_left != 0) sprite_index = s_player_run;
// else sprite_index = s_player;

var y_offset = (sprite_height - sprite_height*yscale)/2;
draw_sprite_ext(sprite_index, image_index, x, y+y_offset, facing * xscale, yscale, 0, c_white, image_alpha);