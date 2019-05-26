//going back to main menu from credits
if (state != menu_states.normal) 
{
	state = menu_states.normal;
	menu_control = true;
	menu_committed = -1;
}

