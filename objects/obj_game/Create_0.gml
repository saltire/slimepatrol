// init

enemyMax = 2;
portalsRemaining = 12;

display_set_gui_size(room_width, room_height);

// weapon type enumerator

enum weapon {
	shotgun,
	grenade,
	vacuum,
	flash
}

enemySpawnMin = 50;
enemySpawnMax = 100;
enemySpawnTimeout = 0;

weaponSpawnCount = instance_number(obj_weapon_spawn);
weaponSpawnMin = 75;
weaponSpawnMax = 150;
weaponSpawnTimeout = irandom_range(weaponSpawnMin, weaponSpawnMax);
weaponExpireMin = 200;
weaponExpireMax = 400;
weaponExpireTimeout = 0;

coin = irandom(1);
with instance_find(obj_player_01, 0) currentWeaponType = other.coin ? weapon.shotgun : weapon.vacuum;
with instance_find(obj_player_02, 0) currentWeaponType = !other.coin ? weapon.shotgun : weapon.vacuum;