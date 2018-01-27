count = physics_particle_count();

if (count > 0) {
	buffer = buffer_create(count * 2 * 4, buffer_grow, 4);
	physics_particle_get_data(buffer, flags);
  
	stuck = false;
	for (n = 0; n < count; n++) {
		xx = buffer_read(buffer, buffer_f32);
		yy = buffer_read(buffer, buffer_f32);
		if collision_point(xx, yy, obj_char, false, false) {
			stuck = true;
			break;
		}
	}
	if (stuck) {
		show_debug_message("Stuck!");
	} 
	else {
		show_debug_message("Not stuck!");
	}
	buffer_delete(buffer);
}