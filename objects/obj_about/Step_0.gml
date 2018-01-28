if (gamepad_button_check_pressed(0, gp_select) || gamepad_button_check_pressed(1, gp_select)) {
	room_goto(room_start);
}