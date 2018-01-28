switch (currentWeaponType) {
	case weapon.shotgun: sprite_index = walkSpriteShotgun; break;
	case weapon.grenade: sprite_index = walkSpriteGrenade; break;
	case weapon.vacuum: sprite_index = walkSpriteVacuum; break;
	case weapon.flash: sprite_index = walkSpriteFlash; break;
	default: sprite_index = walkSprite; break;
}	