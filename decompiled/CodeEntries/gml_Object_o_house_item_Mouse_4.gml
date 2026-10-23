if (is_dialog_visible() || o_game.house_item_selected != -1)
{
    exit;
}
switch (get_option(global.options.house_action))
{
    case UnknownEnum.Value_0:
        house_set_build(item);
        break;
    case UnknownEnum.Value_1:
        remove_house_item(item, item_id);
        house_set_build(item, item_id, build_data);
        instance_destroy();
        break;
    case UnknownEnum.Value_2:
        remove_house_item(item, item_id);
        instance_destroy();
        break;
}

enum UnknownEnum
{
    Value_0,
    Value_1,
    Value_2
}
