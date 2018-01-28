// movement
x += xv;
y += yv;

if place_meeting(x, y, obj_impasse) {
	instance_destroy();
	
	physics_particle_group_begin(flags, 0, x, y, groupAngle, xv, yv, 0, image_blend, 1, strength, 1);
	physics_particle_group_circle(groupRadius);
	physics_particle_group_end();
}

// gravity
yv += .5;
