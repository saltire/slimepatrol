if (frames <= 0) {
	physics_particle_group_begin(flags, 0, mouse_x + distance, mouse_y, 0, -spd, 0, 0, 
		c_white, 1, 1, cat);
	physics_particle_group_circle(30);
	group = physics_particle_group_end();
	frames = 2;
}