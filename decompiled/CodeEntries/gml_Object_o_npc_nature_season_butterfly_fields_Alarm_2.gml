if (is_dialog_visible())
{
    exit;
}
actions_dialog(o_shop.shop_items.event_nature_butterfly, o_shop.titles.event_nature_butterfly, 6, 
{
    dialog_id: "nature_butterflies",
    can_toggle: true
});
