function enemy_instance_init()
{
    armor = max(1, rround(level / 3));
    can_draw = get_option(global.options.draw_enemy);
    hp = level * 200;
    has_quark_shield = quark_level > 0;
    if (has_quark_shield)
    {
        quark_shield = power(10, quark_level);
        quark_shield_max = quark_shield;
    }
    if (is_struct(enemy))
    {
        if (!is_undefined(enemy.hp_max))
        {
            hp = get_value_ext(enemy, enemy.hp_max, id);
        }
    }
    hp = apply_max_number(hp);
    hp_max = hp;
    if (is_struct(enemy) && enemy.is_persistent && get_default_struct_value(enemy.data, "hp", -1) > 0)
    {
        hp = enemy.data.hp;
    }
    hp = clamp(hp, 1, hp_max);
    if (o_game.area.type.key == global.area_types.tower.key)
    {
        expire_duration = sec(global.game_settings.enemy_expire_duration_tower);
        if (is_boss)
        {
            expire_duration = sec(global.game_settings.enemy_expire_duration_tower_boss);
        }
    }
    else if (o_game.area.type.key == global.area_types.boss.key)
    {
        expire_duration = sec(global.game_settings.enemy_expire_duration);
        if (is_boss)
        {
            expire_duration = sec(global.game_settings.enemy_expire_duration_boss);
        }
    }
    var scale_size = random_range(0.7, 1.5);
    xscale = scale * scale_size;
    yscale = scale * scale_size;
    sprite_index = sprite;
    var padding = 100;
    if (is_boss)
    {
        can_draw = true;
        xscale = scale * 1.5;
        yscale = scale * 1.5;
        x = room_width / 2;
        y = room_height / 2;
    }
    else
    {
        x = irandom_range(padding, room_width - padding);
        y = irandom_range(padding, room_height - padding);
    }
    if (is_moving)
    {
        speed = _speed;
        direction = irandom(360);
    }
    if (is_undefined(blend_color))
    {
        blend_color = 16777215;
    }
}
