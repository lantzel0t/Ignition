///calculate_movement_and_collision(velocity, direction)

var dir = argument[1];
var anglefound = false;
var xpos = sin(degtorad(dir)) * vel;
var ypos = cos(degtorad(dir)) * vel;
if (!place_meeting(x + xpos, y + ypos, o_collidable3d))
{
	x += xpos;
	y += ypos;
} else
{
	if (place_meeting(x + xpos, y + ypos, o_player))
	{
		subtract_health(vel);
	} else if ((place_meeting(x + xpos, y + ypos, o_enemyCar) || place_meeting(x + xpos, y + ypos, o_enemyCar2))
		&& (object_index = o_player))
	{
		with (instance_place(x + xpos, y + ypos, o_enemyCar))
		{
			hp -= vel * 3;
		}
		with (instance_place(x + xpos, y + ypos, o_enemyCar2))
		{
			hp -= vel * 3;
		}
	}
	var sweep_interval = 10;
	for (var angle = sweep_interval; angle <= 50; angle += sweep_interval)
	{
		for (var mult = -1; mult <= 1; mult += 2)
		{
			var angle_check = dir - 90 + angle * mult;
			var xtarg = x + lengthdir_x(vel, angle_check);
			var ytarg = y + lengthdir_y(vel, angle_check);
			if (!place_meeting(xtarg, ytarg, o_collidable3d))
			{
				x = xtarg;
				y = ytarg;
				if (object_index == o_player && o_cameraController.trauma < 0.2) {
					addTrauma(0.05);
					subtract_health(0.5);
				}
				vel /= 1.08;
				
				image_angle += mult;
				anglefound = true;
				exit;
			}
		}
	}
	if (!anglefound && abs(vel) > 2)
	{
		if (object_index == o_player) {
			addTrauma(abs(vel) * 0.03);
			subtract_health(abs(vel) * 2);
		}
		vel = -vel / 2;	
	} else vel = 0;
}
//else vel = -vel;