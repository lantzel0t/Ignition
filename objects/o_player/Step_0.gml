#region controls
gamepad_set_axis_deadzone(0,0.25);
switch (control_scheme)
{
	case "keyboard":
	var key_up =	keyboard_check(ord("W"));
	var key_left =  keyboard_check(ord("A"));
	var key_down =  keyboard_check(ord("S"));
	var key_right = keyboard_check(ord("D"));
	var key_dump =  keyboard_check(ord("F"));
	break;
	case "controller":
	var key_up =	gamepad_button_value(0, gp_shoulderrb);
	var key_left = -gamepad_axis_value(0, gp_axislh);
	var key_down =  gamepad_button_value(0, gp_shoulderlb);
	var key_right = 0;
	var key_dump =  gamepad_button_check(0, gp_face1);
	break;
}
#endregion
//interpret input
x_axis = (key_right - key_left);
y_axis = (key_down - key_up);
vel[0] = clamp(vel[0] + x_axis, -maxvel, maxvel);
vel[1] = clamp(vel[1] - (y_axis * accel), -maxvel, maxvel);

//if no buttons are pressed, lerp any movement back to 0
if (x_axis == 0)
{
	turnAng = lerp(turnAng, 0, 0.5);
}
if (y_axis == 0)
{
	vel[1] = lerp(vel[1], 0, 0.2);	
}
//if moving forward, add wheel rotation
if (y_axis != 0)
{
	playerAng += turnAng;	
}
//move car based on velocity
calculate_movement_and_collision();

//turns the wheelies
if (y_axis < 0)
{
	turnAng = clamp(turnAng - (0.5 * x_axis), -maxTurnAng, maxTurnAng);
}
else if (y_axis > 0)
{
	turnAng = clamp(turnAng + (0.5 * x_axis), -maxTurnAng, maxTurnAng);
}
  //when not turning, sets wheels forward
if (x_axis == 0)
{
	clamp(turnAng + 0.2, -maxTurnAng, maxTurnAng);
}
if (abs(playerAng) > 360)
{
	playerAng = 0;
}
image_angle = global._viewang + playerAng;

if (key_dump && alarm[0] == -1)
{
	alarm[0] = 2;
}

//wheel math!
var sinPlayerAng = sin(degtorad(playerAng + 90));
var cosPlayerAng = cos(degtorad(playerAng + 90));
leftWheelY = (-sinPlayerAng * frontAxle) + (cosPlayerAng * distancetoWheel);
leftWheelX = (cosPlayerAng * frontAxle) + (sinPlayerAng * distancetoWheel);
rightWheelY = (-sinPlayerAng * frontAxle) + (cosPlayerAng * -distancetoWheel);
rightWheelX = (cosPlayerAng * frontAxle) + (sinPlayerAng * -distancetoWheel);
wheelAngle = playerAng + radtodeg(turnAng/4);
