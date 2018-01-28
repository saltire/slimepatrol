///@description

//velocity based variables
hspd = 0;				//current horizontal speed
vspd = 0;				//current vertical speed
moveSpeed = 3;			//pixels moved each step
acc = 1;				//increments run speed until moveSpeed is reached
dec = 1;				//decrements moveSpeed until stopped
jumpSpeed = 9;			//pixels moved each jump (gravity lowers this value)
grav = 0.5;				//jumpSpeed decreased by this value each step
terminalVelocity = jumpSpeed*2; //maximum falling speed
climbSpeed = 2;			//pixels moved when climbing ladders
onPlatformSpeed = moveSpeed;
jumpGraceFrames = game_get_speed(gamespeed_fps)/15;	//frames you can jump after walking off ledge

//states
onGround = false;       //check if on the ground
onGroundPrev = false;	//check if was on the ground last step
onLadder = false;       //check if on a ladder
canMove	= true;         //movement toggle
canJump = true;			//jump toggle
canDrop = false;        //check if dropping through platform
canShortHop = true;		//allow short hopping
airControl = true;		//allow velocity change in air
facing = 1;				//1 right 0 left

//shooting animation
shootAnimCount = 0;		//counter for shoot frame hold
shootAnimMax = 12;		//how many steps attack frame is held

currentWeaponType = noone;

//moving platforms
//onPlatformCheck = true;
//onPlatform = false;
//xoffset = 0;

//sprite list
idleSprite = noone;
walkSprite = noone;
walkSpriteShotgun = noone;
walkSpriteGrenade = noone;
walkSpriteVacuum = noone;
walkSpriteFlash = noone;

dead = false;
//alpha = 0;


touchingSlime = false; // are we touching slime?
slimeSpeedRatio = 50; // amount that each slime particle moves the player (lower is more)
slimeSlowAmount = 0.5; // amount that each slime particle slows down the player

gunCooldown = 0;
gunCooldownRate = 25;
bulletCount = 5;
spreadAngle = 4;
bulletSpeed = 11;

grenadeCooldown = 0;
grenadeCooldownRate = 50;
grenadeSpeed = 10;
grenadeDefaultAngle = 25;

vacuum = noone; // id of vacuum cleaner instance
flash = noone; // id of flash cleaner instance

energy = 100;


arrowDistance = 20;