/// @description Insert description here
// You can write your code in this editor
if (image_xscale < 1 && life <= death)
{
image_xscale = lerp(image_xscale, 1, 0.1);
image_yscale = image_xscale;
} 

if (image_xscale > 0.9 && collision_point(x,y,o_player,false,true) || collision_point(x,y,o_enemyCar2,false,true))
{
	instance_create_depth(x,y, depth - 1, o_gasLit);
	part_particles_create(global.PS_high, x, y, global.Part_fburst, 20);
	if (place_meeting(x, y, o_player)) {
		global.immune = 10;
	}
	instance_destroy();
}
life++;
if (life >= death)
{
	image_xscale -= 0.05;
	image_yscale = image_xscale;
}
if (image_xscale <= 0)
{
	instance_destroy();
}