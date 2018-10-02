if (!place_meeting(x - sin(degtorad(playerAng)) * vel, y - cos(degtorad(playerAng)) * vel, o_wall))
{
	x -= sin(degtorad(playerAng)) * vel;
	y -= cos(degtorad(playerAng)) * vel;
}