frames -= 1;

if (group == noone) {
	physics_particle_group_begin(flags, 0, 
		x + lengthdir_x(groupDistance, direction), y + lengthdir_y(groupDistance, direction), 
		0, -lengthdir_x(spd, direction), -lengthdir_y(spd, direction), 0, c_white, 1, 1, cat);
	physics_particle_group_circle(groupRadius);
	group = physics_particle_group_end();
}
else {
	physics_particle_delete_region_circle(
	x + lengthdir_x(deleteDistance, direction), y + lengthdir_y(deleteDistance, direction), deleteRadius);

	if (frames <= 0) {
		physics_particle_group_delete(group);
		instance_destroy();
	}
}
