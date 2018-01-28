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
if ((instance_exists(obj_player_01) && obj_player_01.y < y-sprite_height)
|| instance_exists(obj_player_02) && obj_player_02.y < y-sprite_height) {

	var ledgeAvailable = place_meeting(x + (hspd*20), y - sprite_height, obj_impasse);
	var ceilingMeeting = place_meeting(x, y - sprite_height, obj_impasse);
	var wallMeeting = place_meeting(x + (hspd*20), y, obj_impasse);
	var jumpViable = ledgeAvailable && !ceilingMeeting && !wallMeeting;

	if (onGround && jumpViable) {
		if (!place_meeting(x,y-jumpSpeed,obj_impasse)) {
		    vspd = -jumpSpeed;
		} else if (place_meeting(x,y-jumpSpeed,obj_impasse)) {
			for (var i = 0; i < jumpSpeed; i++) {
				if (!place_meeting(x,y-i,obj_impasse)) {
					//loop again
				}else{
					vspd = -i;
					break;
				}
			}
		}
	}
	
}

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