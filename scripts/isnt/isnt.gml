/// @desc isnt(value, [options])
/// @arg value to check
/// @arg [options]

for(var _i = 1; _i < argument_count; _i++){
  if(argument[0] == argument[_i]) return false;
}

return true;