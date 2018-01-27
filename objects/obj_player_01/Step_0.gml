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


//count = physics_particle_count();

//if (count > 0) {
//	buffer = buffer_create(count * 2 * 4, buffer_grow, 4);
//	physics_particle_get_data(buffer, flags);
  
//	stuck = false;
//	for (n = 0; n < count; n++) {
//		xx = buffer_read(buffer, buffer_f32);
//		yy = buffer_read(buffer, buffer_f32);
//		if collision_point(xx, yy, obj_char, false, false) {
//			stuck = true;
//			break;
//		}
//	}
//	if (stuck) {
//		show_debug_message("Stuck!");
//	} 
//	else {
//		show_debug_message("Not stuck!");
//	}
//	buffer_delete(buffer);
//}

if (keyboard_check(ord("Z")) and (!vacuum or !instance_exists(vacuum))) {
	vacuum = instance_create_layer(x, y - sprite_height / 2, "Instances_1", obj_vacuum);
	vacuum.facing = -image_xscale;
}