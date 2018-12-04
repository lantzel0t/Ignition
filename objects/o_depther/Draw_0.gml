/// @description 
if(ds_exists(ds_depthgrid, ds_type_grid))
{
	ds_grid_sort(ds_depthgrid, 1, true);
	
	for(var yy = 0; yy < ds_grid_height(ds_depthgrid); yy+=1)
	{
		var instanceID = ds_depthgrid[# 0,yy];
		with(instanceID)
		{
			draw_self_3d();
			if (global.control_scheme == "controller")
			{
				//draw_sprite_ext(link, 0, x, y, 10, 0.5, global._viewang, c_white, 1);
			}
		}
	}
	ds_grid_destroy(ds_depthgrid);
}