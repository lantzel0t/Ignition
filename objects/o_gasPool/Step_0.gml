/// @description Insert description here
// You can write your code in this editor
if (new && image_xscale < 0.9)
{
image_xscale = lerp(image_xscale, 1, 0.1);
image_yscale = image_xscale;
} 
else 
{
	new = false;
}

if (image_xscale > 0.9 && collision_point(x,y,o_player,false,true))
{
	image_blend = c_red;
	ignited = true;
}
if (ignited)
{
	alarm[0] = 30;
	ignited = false;
}
if (image_blend = c_red)
{
	image_xscale -= 0.01;
	image_yscale = image_xscale;
}