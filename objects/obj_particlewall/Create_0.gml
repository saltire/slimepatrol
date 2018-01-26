flags = phy_particle_flag_wall;
groupflags = 0;

physics_particle_group_begin(flags, groupflags, x, y, 0, 0, 0, 0, c_white, 1, 1, 2);
physics_particle_group_box(16, 16);
physics_particle_group_end();