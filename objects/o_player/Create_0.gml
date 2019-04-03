//if (live_call()) return live_result;

vx = 0; //horizontal speed
vy = 0; //vertical speed

movespeed = .9;
accel = .6;
air_accel = .1;
frc = .3;
jumpspeed = 4;
grav = .1;
vari_jump_accel = .2;
vterm = 1.7;
grounded = false;

//Forgiveness mechanic
canjump = 0;
jump_buffer = 5; //amount of frames for forgiveness

spr_walk = s_player;
spr_idle = s_player;
