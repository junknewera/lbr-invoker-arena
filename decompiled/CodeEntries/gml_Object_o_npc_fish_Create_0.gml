event_inherited();
repeat (irandom_range(6, 9))
{
    instance_create_layer(0, 0, global.layers.sub_items, o_deco_fish);
}

custom_func = function()
{
    open_nav("fishing");
};
