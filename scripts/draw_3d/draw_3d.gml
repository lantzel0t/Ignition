/// draw_3d(sprite, x, y, angle)
var sprite = argument0;
var ox = argument1;
var oy = argument2;
var angle = argument3;
for (var _i = 0; _i < sprite_get_number(sprite); _i++) //loops through the subimage of the current sprite's frames
{
	draw_sprite_ext(sprite,
					_i, //current subimage i to draw
					ox - (global._viewx * _i) * global._viewz, //x offset based on i, with z angle modifier
					oy - (global._viewy * _i) * global._viewz, //y offset based on i, with z angle modifier
					image_xscale,
					image_yscale,
					angle - global._viewang, //keeps the 3d model visually upright
					image_blend,
					image_alpha);
}