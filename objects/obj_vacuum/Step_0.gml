if (group != 0) {
	frames -= 1;
	
	if (frames <= 0) {
		physics_particle_group_delete(group);
		group = 0;
	}
}