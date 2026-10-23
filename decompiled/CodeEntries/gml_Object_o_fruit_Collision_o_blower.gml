var player_hp_fruit_upgrade_count = get_upgrade_count(global.shops.mythical.player_hp_fruit);
if (player_hp_fruit_upgrade_count > 0)
{
    o_blower.hp += player_hp_fruit_upgrade_count;
    o_blower.hp = clamp(o_blower.hp, 0, o_blower.hp_max);
    global.player_hp = o_blower.hp;
}
collect_fruit();
