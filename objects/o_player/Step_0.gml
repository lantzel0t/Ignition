#region controls
switch (control_scheme)
{
	case "keyboard":
	var key_up =	keyboard_check(ord("W"));
	var key_left =  keyboard_check(ord("A"));
	var key_down =  keyboard_check(ord("S"));
	var key_right = keyboard_check(ord("D"));
	break;
	case "controller":
	var key_up =	keyboard_check(ord("W"));
	var key_left =  keyboard_check(ord("A"));
	var key_down =  keyboard_check(ord("S"));
	var key_right = keyboard_check(ord("D"));
	break;
}
#endregion
//interpret input
x_axis = (-key_left + key_right);
y_axis = (-key_up + key_down);
vel[0] = clamp(vel[0] + x_axis, -maxvel, maxvel);
vel[1] = clamp(vel[1] - (y_axis * accel), -maxvel, maxvel);

//if no buttons are pressed, lerp any movement back to 0
if (x_axis == 0)
{
	turnAng = lerp(turnAng, 0, 0.2);
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
x -= sin(degtorad(playerAng)) * vel[1];
y -= cos(degtorad(playerAng)) * vel[1];

//turns the wheelies
turnAng = clamp(turnAng - (0.5 * x_axis), -maxTurnAng, maxTurnAng);

//when not turning, sets wheels forward
if (x_axis == 0)
{
	clamp(turnAng + 0.1, -maxTurnAng, maxTurnAng);
}

image_angle = global._viewang + playerAng;