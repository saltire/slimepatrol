randomize();

rooms = [
	room_original, 
	room_alt,
	room_another,
	room_diagonal
];

room_goto(rooms[irandom(array_length_1d(rooms) - 1)]);