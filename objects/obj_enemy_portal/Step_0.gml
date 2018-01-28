if !spawned {
	if image_alpha < 1 {
		image_alpha += fadeInRate;
	}
	else {
		instance_create_layer(x, y, layer, obj_enemy_01);
		spawned = true;
	}
}
else {
	if image_alpha > 0 {
		image_alpha -= fadeOutRate;
	}
	else {
		instance_destroy();
	}
}