function get_combo_multiplier(arg0)
{
    var combo_multiplier = 1;
    if (get_upgrade_count(global.shops.gold.combo) > 0)
    {
        combo_multiplier = rround(1 + (((arg0 - 10) / 30) * (1 + global.upgrade_attributes.combo_rewards) * (1 + global.upgrade_attributes.combo_multiplier)));
        combo_multiplier *= (1 + global.upgrade_attributes.combo_multiplier_multiplier);
        combo_multiplier = max(1, combo_multiplier);
    }
    return combo_multiplier;
}
