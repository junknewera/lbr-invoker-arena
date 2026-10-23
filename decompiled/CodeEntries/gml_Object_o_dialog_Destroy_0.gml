destroying = true;
global.dialog_instance = -1;
if (variable_instance_exists(id, "dialog_id") && variable_instance_exists(id, "scroll_y"))
{
    variable_struct_set(global.dialog_shop_index_last, dialog_id, scroll_y);
}
if (instance_exists(o_game))
{
    o_game.is_dialog_open = false;
    set_game_state(UnknownEnum.Value_0);
    reset_tavern_games();
}
actions = -1;
resources = -1;
titles = -1;
shop_index_last = -1;

enum UnknownEnum
{
    Value_0
}
