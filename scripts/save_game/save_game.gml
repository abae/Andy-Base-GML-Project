var _instance_list = ds_list_create();

//create map for every instance
with(p_save){
	var _map = ds_map_create();
	ds_list_add(_instance_list, _map);
	ds_list_mark_as_map(_instance_list, ds_list_size(_instance_list)-1);
	
	var _obj = object_get_name(object_index);
	ds_map_add(_map, "obj", _obj);
	ds_map_add(_map, "layer", layer);
	//add other things to save here
}

//wrap into map
var _wrapper = ds_map_create();
ds_map_add_list(_wrapper, "ROOT", _instance_list);

//save to string
var _string = json_encode(_wrapper);
save_string_to_file("save.sav", _string);

//nuke data
ds_map_destroy(_wrapper);

show_debug_message("Game Saved!");