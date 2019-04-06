//if (live_call()) return live_result;

event_inherited();

// Movement ///////////////////////////////////////////////////////////////////
movespeed = 5;
accel = 2;
air_accel = .1;
frc = .3;
jumpspeed = 4;
grav = .5;
vari_jump_accel = .2;
vterm = 7;
grounded = false;

// Forgiveness mechanic
canjump = 0;
jump_buffer = 5; //amount of frames for forgiveness

//taking damage
damage = 0; //damage value
invulnerable = false;
damage_timer = room_speed * .75;
global.maxhp = 100;
global.hp = global.maxhp;

// Misc ///////////////////////////////////////////////////////////////////////

// Finite state machine
enum states
{
	normal,
	dead
}
state = states.normal

// For squash + stretch
xscale = 1;
yscale = 1;
facing = image_xscale; // Change xscale in editor to adjust initial facing
