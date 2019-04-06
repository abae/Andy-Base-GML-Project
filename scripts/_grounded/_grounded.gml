/// @description  OnGround();

return place_meeting(x, y + 1, p_wall) || (place_meeting(x, y + 1, p_platform) && !place_meeting(x, y, p_platform));