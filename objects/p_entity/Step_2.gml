// Handle sub-pixel movement
cx += vx;
cy += vy;
vx = round(cx);
vy = round(cy);
cx -= vx;
cy -= vy;

entity_step();


//// Pit death
//if (bbox_right < 0 or bbox_left > room_width or bbox_top > room_height or bbox_bottom < 0)
//    transition("fade",TRANS_MODE.RRESTART);