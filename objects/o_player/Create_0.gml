/// @description Initializing vars
playerAng = 0;
turnAng = 0;
maxTurnAng = 6;
is3d = true;
image_speed = 0;
global.control_scheme = "keyboard";
vel = 0;
maxvel = 12;
accel = 0.175;
fric = 0.1;
invertX = -1;
frontAxle = 32;
distancetoWheel = 10;
wheelAngle = 0;
leftWheelX = 0;
leftWheelY = 0;
rightWheelX = 0;
rightWheelY = 0;
global.pfuel = 10000;
trail_init();
//create_textevent("Test!", -1);

reset_dialogue_defaults();
myPortrait			= link;
myVoice				= snd_voice2;
myFont				= NeoSans;
myName				= "Green";

myPortraitTalk		= link;
myPortraitTalk_x	= 26;
myPortraitTalk_y	= 44;
myPortraitIdle		= link;