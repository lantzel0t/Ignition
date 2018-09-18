with(o_depther)
{
	var screenypos = (other.y * dcos(global._viewang)) + (other.x * dsin(global._viewang));
	if(!ds_exists(ds_depthgrid, ds_type_grid))
	{
		//create grid
		ds_depthgrid = ds_grid_create(2,1);
		//add ID
		ds_depthgrid[# 0, 0] = other;
		//add y pos
		ds_depthgrid[# 1,0] = screenypos;
	}
	else
	{
		//resize grid
		var heightOfGrid = ds_grid_height(ds_depthgrid);
		ds_grid_resize(ds_depthgrid, 2, heightOfGrid+1);
		//add ID
		ds_depthgrid[# 0,heightOfGrid] = other;
		//add y pos
		ds_depthgrid[# 1,heightOfGrid] = screenypos;
	}
}