///calculate_movement_and_collision(velocity, direction)

var dir = argument[1];

if (!place_meeting(x + sin(degtorad(dir)) * vel, y + cos(degtorad(dir)) * vel, o_wall)
	&& !place_meeting(x + sin(degtorad(dir)) * vel, y + cos(degtorad(dir)) * vel, o_enemyCar)
	&& !place_meeting(x + sin(degtorad(dir)) * vel, y + cos(degtorad(dir)) * vel, o_player))
{
	x += sin(degtorad(dir)) * vel;
	y += cos(degtorad(dir)) * vel;
} else
{
	var sweep_interval = 10;
	for (var angle = sweep_interval; angle <= 40; angle += sweep_interval)
	{
		for (var mult = -1; mult <= 1; mult += 2)
		{
			var angle_check = dir - 90 + angle * mult;
			var xtarg = x + lengthdir_x(vel, angle_check);
			var ytarg = y + lengthdir_y(vel, angle_check);
			if (!place_meeting(xtarg, ytarg, o_wall))
			{
				x = xtarg;
				y = ytarg;
				vel /= 2;
				exit;
			}
		}
	}
}
//else vel = -vel;