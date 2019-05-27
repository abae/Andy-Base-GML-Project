gml_pragma("global", "MACROS()");

#macro RES_W 640
#macro RES_H 360

//Controller support
#macro CONTROLLER_DEADZONE 0.3

//Input
#macro iRIGHT       (keyboard_check(ord("D")) or keyboard_check(vk_right))
#macro iRIGHT_P     (keyboard_check_pressed(ord("D")) or keyboard_check_pressed(vk_right))
#macro iLEFT        (keyboard_check(ord("A")) or keyboard_check(vk_left))
#macro iLEFT_P      (keyboard_check_pressed(ord("A")) or keyboard_check_pressed(vk_left))
#macro iUP          (keyboard_check(ord("W")) or keyboard_check(vk_up))
#macro iUP_P        (keyboard_check_pressed(ord("W")) or keyboard_check_pressed(vk_up))
#macro iDOWN        (keyboard_check(ord("S")) or keyboard_check(vk_down))
#macro iDOWN_P      (keyboard_check_pressed(ord("S")) or keyboard_check_pressed(vk_up))
#macro iSPACE       keyboard_check(vk_space)
#macro iSPACE_P     keyboard_check_pressed(vk_space)
#macro iSPACE_R     keyboard_check_released(vk_space)
#macro iSELECT      (iSPACE_P or keyboard_check_pressed(vk_enter))
#macro iMB_LEFT     mouse_check_button(mb_left)
#macro iMB_LEFT_P   mouse_check_button_pressed(mb_left)
#macro iMB_LEFT_R   mouse_check_button_released(mb_left)
#macro iMB_RIGHT    mouse_check_button(mb_right)
#macro iMB_RIGHT_P  mouse_check_button_pressed(mb_right)
#macro iMB_RIGHT_R  mouse_check_button_released(mb_right)

// Save System Support
#macro SAVE_FILE_NAME "game_save.json"
#macro SAVE_PATH game_save_id + "\\" + SAVE_FILE_NAME

#macro APPLICATION_SURFACE_WIDTH surface_get_width(application_surface)
#macro APPLICATION_SURFACE_HEIGHT surface_get_height(application_surface)