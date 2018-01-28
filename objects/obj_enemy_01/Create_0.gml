///@description

//velocity based variables
hspd = 0;				//current horizontal speed
vspd = 0;				//current vertical speed
moveSpeed = 2;			//pixels moved each step
acc = 1;				//increments run speed until moveSpeed is reached
dec = 1;				//decrements moveSpeed until stopped
jumpSpeed = 9;			//pixels moved each jump (gravity lowers this value)
grav = 0.5;				//jumpSpeed decreased by this value each step
terminalVelocity = jumpSpeed*2; //maximum falling speed
climbSpeed = 2;			//pixels moved when climbing ladders
onPlatformSpeed = moveSpeed;
jumpGraceFrames = game_get_speed(gamespeed_fps)/10;	//frames you can jump after walking off ledge

//states
onGround = false;       //check if on the ground
onGroundPrev = false;	//check if was on the ground last step
onLadder = false;       //check if on a ladder
canMove	= true;         //movement toggle
canJump = true;			//jump toggle
canDrop = false;        //check if dropping through platform
canShortHop = true;		//allow short hopping
airControl = true;		//allow velocity change in air
facing = 1;				//1 right, -1 left

dead = false;

blobCount = random_range(5, 9);
blobSpeed = 10;
blobColour = choose(c_red, c_green, c_purple, c_lime, c_yellow);

// grenade explosion particles
flags = phy_particle_flag_viscous | phy_particle_flag_tensile | phy_particle_flag_colourmixing;
strength = .25;
explodeSpeed = 300;
explodeGroupRadius = 15;
explodeBlobCount = random_range(2, 4);
explodeSpreadAngle = 20;