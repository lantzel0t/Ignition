if (image_xscale > 0.9 && place_meeting(x, y, o_gasLit))
{
	instance_create_depth(x,y, depth - 1, o_gasLit);
	instance_destroy();
}
alarm[0] = 5;