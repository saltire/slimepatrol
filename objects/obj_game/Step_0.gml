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

if weaponSpawnTimeout > 0 {
	weaponSpawnTimeout--;
}
else {
	if !instance_exists(obj_weapon_drop) {
		with instance_find(obj_weapon_spawn, irandom(weaponSpawnCount)) {
			with instance_create_depth(x, y, layer, obj_weapon_drop) {
				weaponType = irandom(3);
			}
		}
		weaponExpireTimeout = irandom_range(weaponExpireMin, weaponExpireMax);
	}
	weaponSpawnTimeout = irandom_range(weaponSpawnMin, weaponSpawnMax);
}

if weaponExpireTimeout > 0 {
	weaponExpireTimeout--;
}
else if instance_exists(obj_weapon_drop) {
	instance_destroy(obj_weapon_drop);
}
