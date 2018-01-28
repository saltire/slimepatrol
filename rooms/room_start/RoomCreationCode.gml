randomize();

audio_stop_all();
audio_play_sound(snd_gamejam_loop, 200, true);

global.rooms = [
	room_original, 
	room_alt,
	room_another,
	room_diagonal
];
