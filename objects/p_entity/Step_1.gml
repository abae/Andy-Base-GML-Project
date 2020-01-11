grounded = _grounded();

if (place_meeting(x+1,y,o_wall) or place_meeting(x-1,y,o_wall)) nextToWall = true;
else nextToWall = false;