if (is_dialog_visible() || o_game.house_item_selected != -1)
{
    exit;
}
remove_house_item(item, item_id);
house_set_build(item, item_id, build_data);
instance_destroy();
