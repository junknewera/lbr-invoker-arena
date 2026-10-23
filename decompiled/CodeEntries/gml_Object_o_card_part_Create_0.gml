event_inherited();
outline_color = undefined;
player_has_magnet = get_upgrade_count(global.shops.gems.cards_magnet) > 0;
sprite = spr_icon_card_part;
visible = get_option(global.options.draw_other_items);
var card_part_count = 1;
resources.card_parts = card_part_count;
