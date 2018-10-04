#region controls
if (point_direction(x,y, o_pathfollow.x, o_pathfollow.y) > playerAng)
{
	x_axis = 1;
} else if (point_direction(x,y, o_pathfollow.x, o_pathfollow.y) < playerAng)
{
	x_axis = -1;
} else
{
	x_axis = 0;
}
//playerAng = point_direction(x,y, o_pathfollow.x, o_pathfollow.y) - 90;
	y_axis = -1;
	vel = clamp(vel - (y_axis * accel), -maxvel, maxvel);
	targTurnAng = x_axis * maxTurnAng;	
#endregion
//interpret input
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
	//playerAng += turnAng;
}
//move car based on velocity
calculate_movement_and_collision();

//turns the wheelies
if (vel > 0.1)
{
	//turnAng = clamp(turnAng - (0.5 * x_axis), -maxTurnAng, maxTurnAng);
	playerAng += turnAng * (abs(vel) / maxvel);
}
else if (vel < -0.1)
{
	
	playerAng -= turnAng * (abs(vel) / maxvel);
}

  //when not turning, sets wheels forward
if (x_axis == 0)
{
	//clamp(turnAng + 0.2, -maxTurnAng, maxTurnAng);
}
if (abs(playerAng) > 360)
{
	playerAng = 0;
}
image_angle = global._viewang + playerAng;

//wheel math!
var sinPlayerAng = sin(degtorad(playerAng + 90));
var cosPlayerAng = cos(degtorad(playerAng + 90));
leftWheelY = (-sinPlayerAng * frontAxle) + (cosPlayerAng * distancetoWheel);
leftWheelX = (cosPlayerAng * frontAxle) + (sinPlayerAng * distancetoWheel);
rightWheelY = (-sinPlayerAng * frontAxle) + (cosPlayerAng * -distancetoWheel);
rightWheelX = (cosPlayerAng * frontAxle) + (sinPlayerAng * -distancetoWheel);
wheelAngle = playerAng + radtodeg(turnAng/10);

skid_sys = part_system_create();
skid_emitter = part_emitter_create(skid_sys);
skid = part_type_create();
part_type_scale(skid, 6, 6);
part_type_alpha1(skid, 0.3);
part_type_life(skid, 20, 20)
//part_particles_create(skid_sys, x + leftWheelX, y + leftWheelY, skid, 1);
//part_particles_create(skid_sys, x + rightWheelX, y + rightWheelY, skid, 1);
//part_particles_create(skid_sys, x + (cosPlayerAng * distancetoWheel), y + (sinPlayerAng * distancetoWheel), skid, 1);
//part_particles_create(skid_sys, x + (cosPlayerAng * -distancetoWheel), y + (sinPlayerAng * -distancetoWheel), skid, 1);