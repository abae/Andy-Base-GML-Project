///@function draw_sprite_pie(_spr, _ind, _x1, _y1, _x2, _y2, _colour, _alpha, _percent)
/*
    Draws sprite in a pie(pizza?)-shaped manner that resembles something like those radial cooldown timers.
    * x1, y1, x2, y2 defines the area of sprite
    * percent parameter must be in 0..1 range.
   
    Example usage :
    var _x = 200, _y = 100;
    var _size = 200, _fill = sin(renderTime * render2PISecond) * 0.5 + 0.5;
    draw_sprite_pie(sprUITestCat, image_index, _x, _y, _x + _size, _y + _size, c_white, 1, _fill);
   
    MMXX ZIK, send help
*/
/// @arg sprite
/// @arg index
/// @arg x1
/// @arg y1
/// @arg x2
/// @arg y2
/// @arg color
/// @arg alpha
/// @arg percent

var _spr, _ind, _x1, _y1, _x2, _y2, _colour, _alpha, _percent;

_spr = argument0;
_ind = argument1;
_x1 = argument2;
_y1 = argument3;
_x2 = argument4;
_y2 = argument5;
_colour = argument6;
_alpha = argument7;
_percent = argument8;

var _halfwid = abs(_x1 - _x2) * 0.5;
var _halfhei = abs(_y1 - _y2) * 0.5;
var _midx = _x1 + _halfwid;
var _midy = _y1 + _halfhei;
 
// 1] Convert percentage to radians to fit in the sin/cos
var _rad = clamp(_percent, 0, 1) * (2 * pi) - 1.5708; // 1.5708 : 90deg in radians. We're basically adding a 90 degrees offset.
 
// 2] Calculate unit vector from given direction
var _unitx = cos(_rad);
var _unity = sin(_rad);
 
// 3] Prepare to manipulate the vector so that we get the following :
// * Above vector modified so that the x component is normalized to 1
// * Above vector modified so that the y component is normalized to 1
// Determine which vector to use
// If x-component of original unit vector is smaller than y-component, Use vector B
// Otherwise, Use vector A.
// (The hack below can be substituted to this if-else statement : if (abs(_unitx) < abs(_unity)) {_divisor = _unity;} else {_divisor = _unitx;} )
var _det = floor(sign(abs(_unity) - abs(_unitx)) * 0.5 + 1.0);
var _divisor = abs(lerp(_unitx, _unity, _det)); // this bad boy, it returns the x component of unit vector, if x component is smaller than y component .. otherwise it returns y component.
var _vecx = _unitx / _divisor;
var _vecy = _unity / _divisor;
 
// 4] ENGAGE DRAWING :DD
// hmm
var _tex = sprite_get_texture(_spr, _ind);
draw_primitive_begin_texture(pr_trianglefan, _tex);
 
// First two points : one in the middle, another on top of the middle.
draw_vertex_texture_color(_midx, _midy, 0.5, 0.5, _colour, _alpha);
draw_vertex_texture_color(_midx, _midy - _halfhei, 0.5, 0, _colour, _alpha);
 
// Draw the corners part of the pizza
for (var i=0; i<_percent - 0.125; i+=0.25)
{
    // Get the angle to the corner
    var _dir = degtorad(i * 360 - 45);
   
    // Pretty much the same stuff as previous vector manipulating stuff..
    var _ux = cos(_dir);
    var _uy = sin(_dir);
    var _divisor = abs(lerp(_ux, _uy, floor(sign(abs(_uy) - abs(_ux)) * 0.5 + 1.0)));
    var _nx = _ux / _divisor;
    var _ny = _uy / _divisor;
    var _cx = _midx + _nx * _halfwid;
    var _cy = _midy + _ny * _halfhei;
   
    // Now use that to draw the vertex.
    draw_vertex_texture_color(_cx, _cy, _nx * 0.5 + 0.5, _ny * 0.5 + 0.5, _colour, _alpha);
}
 
// Final vertex
var _extendx = _midx + _vecx * _halfwid;
var _extendy = _midy + _vecy * _halfhei;
draw_vertex_texture_color(_extendx, _extendy, _vecx * 0.5 + 0.5, _vecy * 0.5 + 0.5, _colour, _alpha);
draw_primitive_end();