/// @description Insert description here
// You can write your code in this editor
image_xscale -= 0.005;
image_yscale = image_xscale;
//image_alpha -= 0.005

if (image_xscale <= 0.4)
{
	instance_destroy();
}