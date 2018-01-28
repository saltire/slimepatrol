physics_particle_group_begin(flags, 0, mouse_x, mouse_y, random_range(0, 359), spd, -spd, 0, 
	colours[irandom(array_length_1d(colours))], 1, strength, 1);
physics_particle_group_circle(random_range(16, 32));
physics_particle_group_end();