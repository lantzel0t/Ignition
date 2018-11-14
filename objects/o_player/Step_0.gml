#region controls
gamepad_set_axis_deadzone(0,0.25);
switch (global.control_scheme)
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
	var key_left =  -gamepad_axis_value(0, gp_axislh);
	var key_down =  gamepad_button_value(0, gp_shoulderlb);
	var key_right = 0;
	var key_dump =  gamepad_button_check(0, gp_face1);
	break;
}
#endregion
//interpret input
	x_axis = (-key_right + key_left);
	if (global.pfuel > 0)
	{
		y_axis = (key_down - key_up);
		global.pfuel -= 1 + (abs(vel) / 6);
	} else y_axis = 0;
	vel = clamp(vel - (y_axis * accel), -maxvel / 2, maxvel);
	targTurnAng = x_axis * maxTurnAng;
	turnAng = lerp(turnAng, targTurnAng, 0.25); 

//if no buttons are pressed, lerp any movement back to 0
if (x_axis == 0)
{
	turnAng = lerp(turnAng, 0, 0.5);
}
if (y_axis == 0)
{
	vel = lerp(vel, 0, fric);	
}
//if moving forward, add wheel rotation
if (y_axis != 0)
{
	//image_angle += turnAng;
}
//move car based on velocity
calculate_movement_and_collision(vel, image_angle);

//turns the wheelies
if (vel > 0.1)
{
	//turnAng = clamp(turnAng - (0.5 * x_axis), -maxTurnAng, maxTurnAng);
	image_angle += turnAng * (abs(vel) / maxvel);
}
else if (vel < -0.1)
{
	
	image_angle -= turnAng * (abs(vel) / maxvel);
}

  //when not turning, sets wheels forward
if (x_axis == 0)
{
	//clamp(turnAng + 0.2, -maxTurnAng, maxTurnAng);
}
if (abs(image_angle) > 360)
{
	image_angle -= 360 * sign(image_angle);
}
image_angle = image_angle;


//dump fuel
if (key_dump && alarm[0] == -1 && global.pfuel > 30)
{
	alarm[0] = 2;
	global.pfuel -= 30;
}
if(place_meeting(x, y, o_refuel))
{
	global.pfuel = clamp(global.pfuel + 100, 0, 10000);
}
//wheel math!
var sinPlayerAng = sin(degtorad(image_angle + 90));
var cosPlayerAng = cos(degtorad(image_angle + 90));
leftWheelY = (-sinPlayerAng * frontAxle) + (cosPlayerAng * distancetoWheel);
leftWheelX = (cosPlayerAng * frontAxle) + (sinPlayerAng * distancetoWheel);
rightWheelY = (-sinPlayerAng * frontAxle) + (cosPlayerAng * -distancetoWheel);
rightWheelX = (cosPlayerAng * frontAxle) + (sinPlayerAng * -distancetoWheel);
wheelAngle = image_angle + radtodeg(turnAng/10);

skid_sys = part_system_create();
skid_emitter = part_emitter_create(skid_sys);
skid = part_type_create();
part_type_scale(skid, 6, 6);
part_type_alpha1(skid, 0.3);
part_type_life(skid, 20, 20)
//part_particles_create(skid_sys, x + leftWheelX, y + leftWheelY, skid, 1);
//part_particles_create(skid_sys, x + rightWheelX, y + rightWheelY, skid, 1);
//part_particles_create(skid_sys, x + (cosimage_angle * distancetoWheel), y + (sinimage_angle * distancetoWheel), skid, 1);
//part_particles_create(skid_sys, x + (cosPlayerAng * -distancetoWheel), y + (sinPlayerAng * -distancetoWheel), skid, 1);