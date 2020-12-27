if(file_exists("save.sav")){
	with(p_save){
		instance_destroy();
	}
	var _wrapper = load_JSON_from_file("save.sav");
	var _list = _wrapper[? "ROOT"];
	
	for(var i=0; i<ds_list_size(_list); i++){
		var _map = _list[| i];
		
		var _obj = _map[? "obj"];
		var _layer = _map[? "layer"];
		with(instance_create_layer(0,0,_layer,asset_get_index(_obj))){
			//put in saved stuff here
			//x = _map[? "x"];
		}
	}
	ds_map_destroy(_wrapper);
	show_debug_message("Game loaded!")
}