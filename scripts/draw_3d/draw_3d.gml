/// draw_3d(sprite, x, y, angle, offset...)
var sprite = argument[0];
var ox = argument[1];
var oy = argument[2];
var angle = argument[3];
var offset = 0;
if (argument_count > 4)
{
	offset = argument[4];
}
for (var _i = 0; _i < sprite_get_number(sprite); _i++) //loops through the subimage of the current sprite's frames
{
	draw_sprite_ext(sprite,
					_i, //current subimage i to draw
					ox - (global._viewx * (_i + offset)) * global._viewz, //x offset based on i, with z angle modifier
					oy - (global._viewy * (_i + offset)) * global._viewz, //y offset based on i, with z angle modifier
					image_xscale,
					image_yscale,
					angle, //keeps the 3d model visually upright
					image_blend,
					image_alpha);
}