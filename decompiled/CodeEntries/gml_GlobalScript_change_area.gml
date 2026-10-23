function change_area(arg0 = global.areas.garden, arg1 = false)
{
    if (!is_undefined(o_game.area))
    {
        o_game.area.leave();
    }
    global.current_dungeon_boss_spawned = false;
    global.current_tower_floor = 1;
    global.current_tower_floor_enemies_defeated = 0;
    global.current_tower_floor_enemies_disappeared = 0;
    arg0.area_init();
    instance_destroy(o_artifact_usable);
    reset_tavern_games();
    if (arg1)
    {
        instance_destroy(o_dialog);
    }
    if (!get_value_ext(arg0, arg0.check) && arg0.type.key != global.area_types.dungeon.key)
    {
        with (o_game)
        {
            area = global.areas.garden;
            data.current_area_key = area.key;
            init_game_soft();
        }
        exit;
    }
    with (o_game)
    {
        area = arg0;
        data.current_area_key = arg0.key;
        init_game_soft();
    }
    with (o_blower)
    {
        on_area_change();
    }
    with (o_pet)
    {
        on_area_change();
    }
    arg0._enter();
    var bg_layer = layer_get_id("Background");
    var bg_id = layer_background_get_id(bg_layer);
    layer_background_blend(bg_id, arg0.bgcolor);
    var bg_sprite_layer = layer_get_id("BG_Sprite");
    var bg_sprite_stretch_layer = layer_get_id("BG_Sprite_Stretch");
    var bg_sprite_id = layer_background_get_id(bg_sprite_layer);
    var bg_sprite_stretch_id = layer_background_get_id(bg_sprite_stretch_layer);
    var bg_sprite = (arg0.bgsprite == -1) ? spr_solid : arg0.bgsprite;
    var bg_sprite_stretch = (arg0.bgsprite_stretch == -1) ? spr_solid : arg0.bgsprite_stretch;
    layer_background_sprite(bg_sprite_id, bg_sprite);
    layer_background_sprite(bg_sprite_stretch_id, bg_sprite_stretch);
    var layer_background_blend_color = is_undefined(arg0.bgcolor_blend) ? 16777215 : arg0.bgcolor_blend;
    layer_background_blend(bg_sprite_stretch_id, layer_background_blend_color);
    camera_init();
    set_rich_presence();
    if (is_struct(variable_struct_get(o_game.data.mirrors, arg0.key)))
    {
        load_mirror(variable_struct_get(o_game.data.mirrors, arg0.key));
    }
}
