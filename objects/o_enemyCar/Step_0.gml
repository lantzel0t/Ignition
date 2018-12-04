#region controls
var source = point_direction(x,y, global.target.x, global.target.y);
if ((source < image_angle && (image_angle - source < 180)) ||
	(image_angle < source && (source - image_angle > 180)))
{
	x_axis = -1;
} else if ((image_angle < source && (source - image_angle < 180)) ||
	(source < image_angle && (image_angle - source > 180)))
{
	x_axis = 1;
} else
{
	x_axis = 0;
}

//playerAng = point_direction(x,y, o_pathfollow.x, o_pathfollow.y) - 90;
	y_axis = -1;
	if (dead)
	{
		x_axis = 0;
		y_axis = 0;
	}
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
if (dead) 
{
	image_blend = c_gray;
	image_alpha -= 0.01;
}
if (image_alpha < 0) instance_destroy();
calculate_movement_and_collision(vel, image_angle + 90);

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
if (playerAng > 360)
{
	playerAng -= 360;
}
if (playerAng < 0)
{
	playerAng += 360;
}
image_angle = playerAng;

	if ((place_meeting(x,y,o_gasLit) || hp <= 0) && !dead)
	{
		dead = true;
		global.enemies--;
		alarm[0] = 20;
		//instance_destroy();
	}


//wheel math!
var sinPlayerAng = sin(degtorad(playerAng));
var cosPlayerAng = cos(degtorad(playerAng));
leftWheelY = (-sinPlayerAng * frontAxle) + (cosPlayerAng * distancetoWheel);
leftWheelX = (cosPlayerAng * frontAxle) + (sinPlayerAng * distancetoWheel);
rightWheelY = (-sinPlayerAng * frontAxle) + (cosPlayerAng * -distancetoWheel);
rightWheelX = (cosPlayerAng * frontAxle) + (sinPlayerAng * -distancetoWheel);
pipeX = (cosPlayerAng * -6) + (sinPlayerAng * 6);
pipeY = (-sinPlayerAng * -6) + (cosPlayerAng * 6);
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
