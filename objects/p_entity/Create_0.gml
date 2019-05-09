jumped = false;
landed = false;

platformTarget = 0;
wallTarget     = 0;

nexttowall = false;

// Velocity
vx = 0;
vy = 0;
vx_prev = 0;
vy_prev = 0;

// Used for sub-pixel movement
cx = 0;
cy = 0;

grounded = _grounded();

