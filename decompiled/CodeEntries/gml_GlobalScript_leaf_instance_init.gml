function leaf_instance_init()
{
    friction = global.game_settings.leaf_friction;
    armor = type.armor;
    scale = clamp(base_scale * level, 0.75, 6);
    base_scale = clamp(random_range(0.75, 1.25) * type.scale * level, 0.75, 6);
    direction_drift = type.direction_drift;
    min_blow_speed = max(0, type.min_blow_speed - (1 * get_upgrade_attribute_value(variable_struct_get(global.upgrade_attributes.min_blow_speed_reduction, type.key))));
    if (type.is_gem_leaf)
    {
        base_scale *= 2;
    }
    if (is_struct(unique))
    {
        armor = 10000000000000000000000000;
        base_scale = 0.5;
        image_xscale = base_scale;
        image_yscale = base_scale;
    }
    else if (is_struct(community_leaf))
    {
        armor = 10000000000000000000000000;
        base_scale = get_sprite_scale_to_size(32, sprite_get_width(sprite_index));
        image_xscale = base_scale;
        image_yscale = base_scale;
    }
    if (type.anim)
    {
        image_index = -1;
        image_speed = 1;
    }
    else if (type.crumble)
    {
        crumble_duration = type.crumble_duration * (1 + get_upgrade_attribute_value(global.upgrade_attributes.leaf_crumble_duration));
        image_index = 0;
    }
    _image_index = image_index;
    init_after();
}
