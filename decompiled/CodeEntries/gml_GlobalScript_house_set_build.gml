function house_set_build(arg0, arg1 = undefined, arg2 = undefined)
{
    instance_destroy(o_house_item_build);
    var o = instance_create_layer(mouse_x, mouse_y, arg0.grid_layer, o_house_item_build);
    o.item = arg0;
    o.sprite_index = arg0.sprite;
    if (!is_undefined(arg2))
    {
        o.build_data = arg2;
        o.img_angle = arg2.img_angle;
        o.img_index = arg2.img_index;
    }
    if (!is_undefined(arg1))
    {
        o.item_id = arg1;
    }
    o_game.house_item_selected = o;
}
