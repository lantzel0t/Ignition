///calculate_movement_and_collision(velocity, direction)

var dir = argument[1];

if (!place_meeting(x - sin(degtorad(dir)) * vel, y - cos(degtorad(dir)) * vel, o_wall)
	&& !place_meeting(x - sin(degtorad(dir)) * vel, y - cos(degtorad(dir)) * vel, o_enemyCar)
	&& !place_meeting(x - sin(degtorad(dir)) * vel, y - cos(degtorad(dir)) * vel, o_player))
{
	x -= sin(degtorad(dir)) * vel;
	y -= cos(degtorad(dir)) * vel;
} else vel = -vel;