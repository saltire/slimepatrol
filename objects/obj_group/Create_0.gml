// physics_world_update_speed(120);
physics_particle_set_damping(2);
physics_particle_set_radius(5);

colours = [c_red, c_green, c_purple];

flags = phy_particle_flag_viscous | phy_particle_flag_spring | phy_particle_flag_colourmixing;
strength = .25;
size = 16;
spd = 300;
