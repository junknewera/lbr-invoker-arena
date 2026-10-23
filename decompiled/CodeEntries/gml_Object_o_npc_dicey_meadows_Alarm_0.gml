alarm[0] = spawn_timer;
set_dice_vars();
repeat (charges)
{
    if (!can_spawn_dice())
    {
        break;
    }
    var value = get_dice_drop_value();
    var res = build_resource_cost(global.resources.dice, value);
    var o = spawn_collectable(room_width / 2, room_height / 2, global.layers.equipment, o_die, res, 
    {
        persist_area: true,
        resources: res
    });
    o.direction = 100 * o_game.data.dice.drop_total;
    o_game.data.dice.drop_total++;
    o_game.data.dice.drop_timer += drop_delay;
    charges--;
}
