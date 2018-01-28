if steps % stepsPerFrame == 0 {
	frame = steps / stepsPerFrame;
	if frame < frames {
		currentFrame = frame;
	}
}

steps++;


if (gamepad_button_check_pressed(0, gp_start) || gamepad_button_check_pressed(1, gp_start)) {
	room_goto(global.rooms[irandom(array_length_1d(global.rooms) - 1)]);
}
