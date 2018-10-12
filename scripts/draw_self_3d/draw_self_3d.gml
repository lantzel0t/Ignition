for (var _i = 0; _i < image_number; _i++) //loops through the subimage of the current sprite's frames
{
	draw_sprite_ext(sprite_index,
					_i - 1, //current subimage i to draw
					x - (global._viewx * _i) * global._viewz, //x offset based on i, with z angle modifier
					y - (global._viewy * _i) * global._viewz, //y offset based on i, with z angle modifier
					image_xscale,
					image_yscale,
					image_angle, //keeps the 3d model visually upright
					image_blend,
					image_alpha);
}