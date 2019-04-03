if(instance_number(o_textevent)>1 or instance_number(o_textbox)>0){ instance_destroy(); exit; }

//-----------Customise (FOR USER)
myVoice			= sfx_voice2;
myTextCol		= c_white;
myPortrait		= -1;
myFont			= fnt_dialogue;
myName			= "None";

//-----------Setup (LEAVE THIS STUFF)
myTextbox   = noone;
reset_dialogue_defaults();