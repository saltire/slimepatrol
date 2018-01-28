// horizontal movement
hspd = moveSpeed * facing;

// -- HORIZONTAL COLLISIONS --//

if place_meeting(x+hspd,y,obj_impasse) {
    //use slopes going up
    yplus = 0;
    while ( place_meeting(x+hspd,y-yplus,obj_impasse) && yplus <= abs(1*hspd) ) yplus += 1;
    if (place_meeting(x+hspd,y-yplus,obj_impasse)) {
        while (!place_meeting(x+sign(hspd),y,obj_impasse)) x += sign(hspd);
        hspd = 0;
		facing *= -1;
    }else{
        y -= yplus;
    }
}

if (!place_meeting(x+hspd,y+1,obj_impasse)) {
    //use slopes going down
    yminus = 1;
    while ( !place_meeting(x+hspd,y+yminus,obj_impasse) && yminus <= abs(1*hspd) ) yminus += 1;
    if (!place_meeting(x+hspd,y+yminus,obj_impasse)) {
        //gravity
    }else{
        y += yminus;
    }
}

//x movement
x += hspd;

// flip image to match movement direction (facing)
image_xscale = facing;

// vertical movement
if (!onGround) vspd += grav;


// jumping
if jumpProbCooldown > 0 {
	jumpProbCooldown--;
}
else if onGround and hspd != 0 {
	ahead = x + hspd * 20;
	
	// check for ledges at different heights
	targetHeight = 0;
	for (h = 1; h <= 4; h++) {
		ledgeAvailable = collision_point(ahead, y - h * 20 + 10, obj_impasse, false, true) and 
			place_free(ahead, y - h * 20 - 10);
		clearJumpUpward = !collision_line(x, y - sprite_height / 2, x, y - sprite_height - h * 20 + 10, obj_impasse, false, true);
		clearJumpForward = !collision_rectangle(x - sprite_width / 2 * facing, y - sprite_height - h * 20 - 10,
			ahead + sprite_width / 2, y - h * 20 - 10, obj_impasse, false, true);
			
		if ledgeAvailable and clearJumpUpward and clearJumpForward {
			targetHeight = h;
			break;
		}
	}
	
	// we know we can jump, now we decide if we should
	if targetHeight > 0 {
		clearFallDownward = false;
		for (d = 1; d <= moveSpeed; d++) {
			stepAhead = x + d * 20 * facing;
			clearFallDownward = clearFallDownward || !collision_line(stepAhead, y - sprite_height, stepAhead, y + 10, obj_impasse, false, true);
		}
		clearWalkForward = !collision_line(x, y - sprite_height / 2, ahead, y - sprite_height / 2, obj_impasse, false, true);
		canGoForward = clearFallDownward or clearWalkForward;
	
		playerAbove = (instance_exists(obj_player_01) && obj_player_01.y < y - sprite_height / 2) or
			(instance_exists(obj_player_02) && obj_player_02.y < y - sprite_height / 2);
		playerBelow = (instance_exists(obj_player_01) && obj_player_01.y > y - sprite_height / 2) or
			(instance_exists(obj_player_02) && obj_player_02.y > y - sprite_height / 2);
	
		// more likely to jump if there is a player above or if we can't go forward or down
		jumpProb = .35;
		if playerAbove jumpProb += .25;
		if playerBelow jumpProb -= .25;
		if !canGoForward jumpProb += .2;
		
		if random_range(0, 1) < jumpProb {
			// perform a jump, adjusting for target height, until we hit a ceiling
			for (var i = 1; i <= jumpSpeed + targetHeight; i++) {
				if place_meeting(x, y - i, obj_impasse) break;
				vspd = -i;
			}
		}
		else {
			// wait a few frames before trying again
			jumpProbCooldown = jumpProbCooldownRate;
		}
	}
}


// check for player on a higher platform

//var playerAbove = (instance_exists(obj_player_01) && obj_player_01.y < y - sprite_height / 2)
//|| (instance_exists(obj_player_02) && obj_player_02.y < y - sprite_height / 2);

//if (playerAbove) {
//	var ledgeAvailable = place_meeting(x + (hspd*20), y - sprite_height + 10, obj_impasse);
//	var ceilingMeeting = place_meeting(x, y - sprite_height, obj_impasse);
//	var wallMeeting = place_meeting(x + (hspd*20), y-(sprite_height*2), obj_impasse);
//	var outsideBounds = x+(hspd*20)<0 || x+(hspd*20)>room_width || y-sprite_height<0;
//	var jumpViable = ledgeAvailable && !ceilingMeeting && !wallMeeting /*&& !outsideBounds*/;

//	if (onGround && jumpViable) {
//		if (!place_meeting(x,y-jumpSpeed,obj_impasse)) {
//		    vspd = -jumpSpeed;
//		} else if (place_meeting(x,y-jumpSpeed,obj_impasse)) {
//			for (var i = 0; i < jumpSpeed; i++) {
//				if (!place_meeting(x,y-i,obj_impasse)) {
//					//loop again
//				}else{
//					vspd = -i;
//					break;
//				}
//			}
//		}
//	}	
//}

//maximum falling speed
if (vspd > terminalVelocity) vspd = terminalVelocity;

// -- VERTICAL COLLISIONS --//

if (place_meeting(x,y+vspd,obj_impasse)) {
    while (!place_meeting(x,y+(grav*sign(vspd)),obj_impasse)) y += (grav*sign(vspd));
    vspd = 0;
}
if (place_meeting(x,y+1,obj_impasse) && vspd >= 0 ) {
    onGround = true;
}else{
	onGround = false;
}

//y movement
y += vspd;

//round y down to integer
if (onGround) {
    y = floor(y);
}


// Check if touched by a bullet, and remove all bullets touching.
shot = false;
while true {
	bullet = instance_place(x, y, obj_bullet);
	if bullet == noone break;
	shot = true;
	instance_destroy(bullet);
}

if (shot) {
	instance_destroy(); // replace this line with some sort of death state
	
	// create blobs
	for (b = 0; b < blobCount; b++) {
		with instance_create_layer(x, y - sprite_height, layer, obj_slimeblob) {
			direction = other.b * 360 / other.blobCount;
			speed = other.blobSpeed;
			xv = lengthdir_x(speed, direction);
			yv = lengthdir_y(speed, direction);
			
			image_blend = other.blobColour;
		}
	}
}

// Check if touched by an explosion
explosion = instance_place(x, y, obj_explosion);
if explosion != noone {
	instance_destroy(); // replace this line with some sort of death state
	
	yorigin = y - sprite_height / 2;
	explodeDirection = point_direction(explosion.x, explosion.y, x, yorigin);
	
	// create free particles
	physics_particle_group_begin(flags, 0, x, yorigin, 0, 
		(x - explosion.x) * explodeSpeed, (yorigin - explosion.y) * explodeSpeed, 
		0, blobColour, 1, strength, 1);
	physics_particle_group_circle(explodeGroupRadius);
	physics_particle_group_end();
	
	// create blobs
	for (b = 0; b < explodeBlobCount; b++) {
		with instance_create_layer(x, y - sprite_height, layer, obj_slimeblob) {
			direction = other.explodeDirection + (other.b - (other.explodeBlobCount - 1) / 2) * other.explodeSpreadAngle;
			speed = other.blobSpeed;
			xv = lengthdir_x(speed, direction);
			yv = lengthdir_y(speed, direction);
			
			image_blend = other.blobColour;
		}
	}
}