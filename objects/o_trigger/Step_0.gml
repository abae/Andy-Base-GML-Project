if (t_scene_info != -1)
{
	if (!instance_exists(o_cutscene))
	{
		if (place_meeting(x,y,o_player))
		{
			create_cutscene(t_scene_info);
			instance_destroy();
		}
	}
}