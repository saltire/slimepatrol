x += xv;
y += yv;

if place_meeting(x, y, obj_impasse) or place_meeting(x, y, obj_enemy_01) {
	instance_create_layer(x, y, layer, obj_explosion);
	instance_destroy();
}

// gravity
yv += .4; 