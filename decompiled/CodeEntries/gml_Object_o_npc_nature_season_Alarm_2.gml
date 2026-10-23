if (is_dialog_visible())
{
    exit;
}
actions_dialog(o_shop.shop_items.event_nature_plants, o_shop.titles.event_nature_plants, 6, 
{
    dialog_id: "nature_plants",
    can_toggle: true
});
