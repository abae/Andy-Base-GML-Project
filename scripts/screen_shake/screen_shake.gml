/// @desc screen_shake(magnitude,time)
/// @arg Magnitude sets strength
/// @arg Time sets length in frames

with (o_camera)
{
	if (argument0 > shakeRemain)
	{
		shakeMagnitude = argument0;
		shakeRemain = argument0;
		shakeLength = argument1;
	}
}

