/// @description Insert description here
// You can write your code in this editor
if (image_xscale < 1)
{
image_xscale = lerp(image_xscale, 1, 0.1);
image_yscale = image_xscale;
} 

if (image_xscale > 0.9 && collision_point(x,y,o_player,false,true))
{
	instance_create_depth(x,y, depth - 1, o_gasLit);
	instance_destroy();
}