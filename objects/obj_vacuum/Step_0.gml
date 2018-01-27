if (!group) {
	physics_particle_group_begin(flags, 0, x + distance * -facing, y, 0, spd * facing, 0, 0, c_white, 1, 1, cat);
	physics_particle_group_circle(30);
	group = physics_particle_group_end();
}
	
frames -= 1;

if (group and frames <= 0) {
	physics_particle_group_delete(group);
	instance_destroy();
}
