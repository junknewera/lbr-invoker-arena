function fx_prestige(arg0, arg1, arg2)
{
    if (global.debug)
    {
        return after_prestige();
    }
    var o = instance_create_layer(arg0, arg1, global.layers.fx, o_fx_particle);
    var _bg_color = 0;
    var _sprite = spr_leaf;
    var _part_number = 6;
    if (arg2 == global.prestige_levels.blc.level)
    {
        _bg_color = 657980;
        _sprite = array_random_item([spr_leaf_bismuth, spr_leaf_benitoite, spr_leaf_cosmic, spr_leaf_exotic, spr_leaf_gold, spr_leaf_ice, spr_leaf_lava, spr_leaf_mythical, spr_leaf_obsidian, spr_leaf_silicon, spr_leaf_void]);
        _part_number = 8;
    }
    else if (arg2 == global.prestige_levels.mlc.level)
    {
        _bg_color = 670730;
        _sprite = array_random_item([spr_leaf_amber, spr_leaf_amethyst, spr_leaf_emerald, spr_leaf_kyanite, spr_leaf_rhodonite, spr_leaf_ruby, spr_leaf_tektite]);
        _part_number = 10;
    }
    else if (arg2 == global.prestige_levels.ulc.level)
    {
        _bg_color = 3934730;
        _sprite = spr_icon_portal_ulc;
        _part_number = 10;
    }
    with (o)
    {
        if (!get_option(global.options.show_prestige_animation))
        {
            is_active = false;
        }
        part_type_sprite(part_particle, _sprite, 0, false, 1);
        part_type_size(part_particle, 0.04, 3, 0, 0);
        part_type_scale(part_particle, 1, 1);
        part_type_color_mix(part_particle, 3631920, 7763323);
        part_type_alpha3(part_particle, 0.08, 0.29, 0.41);
        part_type_speed(part_particle, 0, 4, 0, 0);
        part_type_direction(part_particle, 0, 360, 0, 0);
        part_type_gravity(part_particle, 0, 126);
        part_type_orientation(part_particle, 180, 180, 1, 0, 1);
        part_type_blend(part_particle, 1);
        part_type_life(part_particle, 434, 500);
        bg_color = _bg_color;
        fade = true;
        is_stream = true;
        part_number = _part_number;
        var lifetime = sec(5);
        if (is_shop_item_enabled(global.shops.gems.prestige_speed))
        {
            lifetime = sec(1);
        }
        init(lifetime);
        
        destroy_func = function()
        {
            after_prestige();
        };
    }
}
