///@desc emit_dust(num,x,y,minvx,maxvx,minvy,maxvy,depth)
///@arg number
///@arg x
///@arg y
///@arg minvx
///@arg maxvx
///@arg minvy
///@arg maxvy
///@arg depth

repeat(argument0){
	var _inst = instance_create_depth(argument1,argument2,argument7,o_dust);
	with (_inst){
		vx = random_range(argument3, argument4);
		vy = random_range(argument5, argument6);
	}
}