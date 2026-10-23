function combo_calculate_leaves()
{
    var combo_value = min(combo_max, combo);
    return floor(power(floor(combo_value / 10), 1.5) * (get_upgrade_count(global.shops.gold.combo_rewards) + 1));
}
