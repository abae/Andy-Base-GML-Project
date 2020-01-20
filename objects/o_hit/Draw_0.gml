if (live_call()) return live_result;

var xx = 250;
var yy = 250;
var w = 1-timer/10;
var surf = surface_create(500,500);
surface_set_target(surf);
gpu_set_blendmode(bm_subtract);
draw_rectangle(0,0,500,500,false);
gpu_set_blendmode(bm_normal);
draw_sprite_ext(s_circle,0,xx,yy,resize,resize,0,c_white,1);
draw_set_color(c_white);
var trix = lengthdir_x(rad-5,angle); 
var triy = lengthdir_y(rad-5,angle); 
var tris = 4-(4*w);
draw_triangle(xx+trix - tris*(sign(trix)),yy+triy + tris*(sign(triy)),xx+trix + tris*(sign(trix)),yy+triy - tris*(sign(triy)),xx+trix*4,yy+triy*4,true);
draw_triangle(xx+trix - tris*(sign(trix)),yy+triy + tris*(sign(triy)),xx+trix + tris*(sign(trix)),yy+triy - tris*(sign(triy)),xx+trix*4,yy+triy*4,false);
draw_triangle(xx-trix - tris*(sign(trix)),yy-triy + tris*(sign(triy)),xx-trix + tris*(sign(trix)),yy-triy - tris*(sign(triy)),xx-trix*4,yy-triy*4,true);
draw_triangle(xx-trix - tris*(sign(trix)),yy-triy + tris*(sign(triy)),xx-trix + tris*(sign(trix)),yy-triy - tris*(sign(triy)),xx-trix*4,yy-triy*4,false);
for (var i = 0; i < 4; i++){
	var trix = lengthdir_x(rad-5,anglelist[i]);
	var triy = lengthdir_y(rad-5,anglelist[i]);
	var tris = 3-(3*w);
	draw_triangle(xx+trix - tris*(sign(trix)),yy+triy + tris*(sign(triy)),xx+trix + tris*(sign(trix)),yy+triy - tris*(sign(triy)),xx+trix*trislist[i],yy+triy*trislist[i],true);
	draw_triangle(xx+trix - tris*(sign(trix)),yy+triy + tris*(sign(triy)),xx+trix + tris*(sign(trix)),yy+triy - tris*(sign(triy)),xx+trix*trislist[i],yy+triy*trislist[i],false);
}

gpu_set_blendmode(bm_subtract);
var scale = w*.2;
draw_sprite_ext(s_circle,0,xx,yy,resize*(.8+scale),resize*1.05,angle,c_black,1);
gpu_set_blendmode(bm_normal);
surface_reset_target();
draw_surface(surf,x-xx,y-yy);
surface_free(surf);