/// @desc angle_rotate(angle, target, speed)
/// @param angle
/// @param target
/// @param speed
var diff;
// 180 is to be replaced by "pi" for radians
diff = wrap(argument1 - argument0, -180, 180);
// clamp rotations by speed:
if (diff < -argument2) return argument0 - argument2;
if (diff > argument2) return argument0 + argument2;
// if difference within speed, rotation's done:
return argument1;