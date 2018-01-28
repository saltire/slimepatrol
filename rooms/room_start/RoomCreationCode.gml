randomize();

global.rooms = [
	room_original, 
	room_alt,
	room_another,
	room_diagonal
];

room_goto(global.rooms[irandom(array_length_1d(global.rooms) - 1)]);