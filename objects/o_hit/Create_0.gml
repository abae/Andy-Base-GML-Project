/// @desc 
timer = 10;
angle = random_range(0,360);
rad = 32;
resize = rad/64;

anglelist = [angle+choose(random_range(330,390),random_range(150,210)),angle+choose(random_range(330,390),random_range(150,210)),angle+choose(random_range(330,390),random_range(150,210)),angle+choose(random_range(330,390),random_range(150,210)),angle+choose(random_range(330,390),random_range(150,210))];
trislist = [random_range(2,3),random_range(2,3),random_range(2,3),random_range(2,3),random_range(2,3)];

screen_shake(5,10);