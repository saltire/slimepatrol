//------------------------------------------------------//
//						MOVEMENT						//
//------------------------------------------------------//

if (canMove) {
	sc_player_movement(gp_padl,gp_padr,gp_padu,gp_padd,gp_face1,0);
}

//------------------------------------------------------//
//						ANIMATION						//
//------------------------------------------------------//

//if (!onGround) {
//	if (vspd <= 0) {
//		sprite_index = jumpSprite;
//	}
////	if (vspd > 0 && !place_meeting(x, y-sprite_height, obj_impasse)) {
////		sprite_index = idleSprite;
////	}

//}

//if (onGround) {
//	if (keyLeft || keyRight) {
//		sprite_index = walkSprite;
//	}
//	if (!keyLeft && !keyRight) {
//	    sprite_index = idleSprite;
//	}	
//	if (keyLeft && keyRight) {
//	    sprite_index = idleSprite;
//	}
//}

//if (onLadder) {
//	sprite_index = climbSprite;
//}


// count how many particles of slime the player is touching
touching = 0;
dxv = 0;
dyv = 0;
count = physics_particle_count();
if count > 0 {
	buffer = buffer_create(count * 4 * 4, buffer_grow, 4);
	physics_particle_get_data(buffer, phy_particle_data_flag_position | phy_particle_data_flag_velocity);
  
	for (n = 0; n < count; n++) {
		xx = buffer_read(buffer, buffer_f32);
		yy = buffer_read(buffer, buffer_f32);
		xv = buffer_read(buffer, buffer_f32);
		yv = buffer_read(buffer, buffer_f32);
		if collision_point(xx, yy, obj_player_01, false, false) {
			touching++;
			dxv += xv;
			dyv += yv;
		}
	}
	
	buffer_delete(buffer);
}

if touching > 0 {
	dxv /= touching;
	dyv /= touching;
}

show_debug_message("Moving by " + string(dxv) + "," + string(dyv));



// spawn a vacuum cleaner instance
if (keyboard_check(ord("Z")) and (!vacuum or !instance_exists(vacuum))) {
	show_debug_message("creating vacuum");
	vacuum = instance_create_layer(x, y - sprite_height / 2, "Instances_1", obj_vacuum);
	vacuum.facing = -image_xscale;
}