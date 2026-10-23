build_data = {};
item = {};
item_id = -1;

init = function()
{
    try
    {
        var item_depth = layer_get_depth(item.grid_layer);
        depth = item_depth - (y / 10);
        image_speed = item.sprite_speed;
    }
    catch (e)
    {
    }
};
