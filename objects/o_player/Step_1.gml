var groundedPrev = grounded;

event_inherited();

if (grounded && !groundedPrev) {
    for (var i = 0; i < 4; ++i) {
        //instance_create_layer(x + random_range(-8, 8), y + 8 + random_range(-2, 2), oParticlePlayer);
    }
    
    xscale = 1.33;
    yscale = 0.67;
}