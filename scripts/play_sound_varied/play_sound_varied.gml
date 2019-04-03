/// @desc play_sound_varied(sound_id,priority,looping)
///@arg sound_id
///@arg priority
///@arg looping

var s = audio_play_sound(argument0,argument1,argument2);
audio_sound_pitch(s,random_range(.8,1.1));

if (global.hp<=0)
{
	audio_sound_pitch(s,random_range(.4,1.5));
}