// go to next level

if (!instance_exists(obj_enemy_01) and !enemySpawnTimeout and !portalsRemaining) {
	while true {
		nextRoom = global.rooms[irandom(array_length_1d(global.rooms) - 1)];
		if nextRoom != room {
			room_goto(nextRoom);
			break;
		}
	}
}


// create an enemy if less than two exist

if (instance_number(obj_enemy_01) < enemyMax and portalsRemaining) {
	if enemySpawnTimeout > 0 {
		enemySpawnTimeout--;
	}
	else {
		with instance_find(obj_enemy_spawn, irandom(instance_number(obj_enemy_spawn))) {
			instance_create_layer(x, y, layer, obj_enemy_portal);
		}
		portalsRemaining--;
		//show_debug_message(portalsRemaining);
		
		if portalsRemaining {
			enemySpawnTimeout = irandom_range(enemySpawnMin, enemySpawnMax);
		}
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
			with instance_create_layer(x, y, layer, obj_weapon_drop) {
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
