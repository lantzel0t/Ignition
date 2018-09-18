//for loop that loops through the numbers of animation name given
//if asset_get_index != -1, frames++;
//return frames
var frames = 0;
for (var i = 0; i < 24; i++)
{
	if (asset_get_index(i) != -1)
	{
		frames++;
	} else
	{
		return frames;	
	}
}
return frames;