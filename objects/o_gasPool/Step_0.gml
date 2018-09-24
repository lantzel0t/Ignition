/// @description Insert description here
// You can write your code in this editor
image_xscale = lerp(image_xscale, 1, 0.1);
image_yscale = image_xscale;
if (image_xscale > 0.9 && collision_point(x,y,o_player,false,true))
{
	image_blend = c_red;
}
if (distance_to_object(o_gasPool) < 100 && instance_nearest(x,y, o_gasPool).image_blend == c_red)
{
	image_blend = c_red;
}