// create and enemy if less than two exist

var enemyCount = instance_number(obj_enemy_01);

if (enemyCount < enemyMax) {
	switch (irandom(1)) {
		case 0: instance_create_layer(560, 80, "SpriteLayer", obj_enemy_01); break;
		case 1: instance_create_layer(80, 80, "SpriteLayer", obj_enemy_01); break;
	}
}

// restart game if both players are dead

if (!instance_exists(obj_player_parent)) {
	room_restart();
}

