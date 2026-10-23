function place_house_item(arg0, arg1, arg2, arg3, arg4, arg5)
{
    var o = instance_create_layer(arg1, arg2, arg0.grid_layer, o_house_item);
    o.item = arg0;
    o.sprite_index = arg0.sprite;
    if (arg5)
    {
        var house_item_id = generate_house_item_id();
        var build_data = 
        {
            _x: arg1,
            _y: arg2,
            img_angle: arg3,
            img_index: arg4,
            item_id: house_item_id
        };
        o.item_id = house_item_id;
        o.build_data = build_data;
        arg0.add_item(build_data);
    }
    with (o)
    {
        init();
    }
    if (!keyboard_check(vk_shift))
    {
        o_game.house_item_selected = -1;
    }
    global.refresh_game_vars = true;
    return o;
}
