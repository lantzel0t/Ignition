if (!place_meeting(x - sin(degtorad(image_angle)) * vel, y - cos(degtorad(image_angle)) * vel, o_wall))
{
	x -= sin(degtorad(image_angle)) * vel;
	y -= cos(degtorad(image_angle)) * vel;
} else vel = -vel;