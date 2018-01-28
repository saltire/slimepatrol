distance = random_range(circleRadius, radius - circleRadius);
angle = random_range(0, 359);
cx = x + lengthdir_x(distance, angle);
cy = y + lengthdir_y(distance, angle);
physics_particle_delete_region_circle(cx, cy, circleRadius);

with instance_create_layer(cx, cy, layer, obj_flash_circle) {
	image_alpha = other.image_alpha;
	image_xscale = other.circleRadius * 2 / sprite_width; 
	image_yscale = other.circleRadius * 2 / sprite_height;
}

image_alpha -= fadeRate;	
if image_alpha <= 0 instance_destroy();