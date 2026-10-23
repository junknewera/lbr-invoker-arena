function get_daily_reward_resources()
{
    var gems_count = ceil(global.upgrade_attributes.daily_reward_gems + 5);
    var daily_reward = 
    {
        materials: {},
        resources: 
        {
            gems: gems_count
        }
    };
    var packs_sum_borb = get_struct_sum(global.upgrade_attributes.daily_reward_borbventure_packs, "", "");
    if (packs_sum_borb > 0)
    {
        daily_reward.borbventure_packs = {};
        var __struct = global.upgrade_attributes.daily_reward_borbventure_packs;
        var __prop_names = struct_get_names(__struct);
        var __prop_len = array_length(__prop_names);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mkey = __prop_names[__i];
            var mitem = variable_struct_get(__struct, mkey);
            add_to_struct_value(daily_reward.borbventure_packs, mkey, mitem);
        }
    }
    var packs_sum = get_struct_sum(global.upgrade_attributes.daily_reward_cards_packs, "", "");
    if (packs_sum > 0)
    {
        daily_reward.cards_packs = {};
        var __struct = global.upgrade_attributes.daily_reward_cards_packs;
        var __prop_names = struct_get_names(__struct);
        var __prop_len = array_length(__prop_names);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mkey = __prop_names[__i];
            var mitem = variable_struct_get(__struct, mkey);
            add_to_struct_value(daily_reward.cards_packs, mkey, mitem);
        }
    }
    var daily_reward_materials = get_upgrade_attribute_value(global.upgrade_attributes.daily_reward_materials);
    if (daily_reward_materials > 0)
    {
        var __array = global.materials_spawnable;
        var __prop_len = array_length(__array);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mitem = __array[__i];
            variable_struct_set(daily_reward.materials, mitem.key, daily_reward_materials);
        }
    }
    var daily_reward_materials_essences = get_upgrade_attribute_value(global.upgrade_attributes.daily_reward_materials_essences);
    if (daily_reward_materials_essences > 0)
    {
        var __array = global.materials_essences;
        var __prop_len = array_length(__array);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mitem = __array[__i];
            var count = daily_reward_materials_essences * get_default_struct_value(mitem, "daily_reward_modifier", 1);
            count = round(count);
            variable_struct_set(daily_reward.materials, mitem.key, count);
        }
    }
    if (is_dlc_purchase_valid(global.shops.dlc.fishing_pack.dlc_id) && is_dlc_claimed(global.shops.dlc.fishing_pack.key))
    {
        add_struct_to_struct(daily_reward, global.shops.dlc.fishing_pack.upgrade_attributes.daily_reward_result);
    }
    if (is_dlc_purchase_valid(global.shops.dlc.nature_pack.dlc_id) && is_dlc_claimed(global.shops.dlc.nature_pack.key))
    {
        add_struct_to_struct(daily_reward, global.shops.dlc.nature_pack.upgrade_attributes.daily_reward_result);
    }
    if (is_dlc_purchase_valid(global.shops.dlc.dice_pack.dlc_id) && is_dlc_claimed(global.shops.dlc.dice_pack.key))
    {
        add_struct_to_struct(daily_reward, global.shops.dlc.dice_pack.upgrade_attributes.daily_reward_result);
    }
    if (is_dlc_purchase_valid(global.shops.dlc.mines_pack.dlc_id) && is_dlc_claimed(global.shops.dlc.mines_pack.key))
    {
        add_struct_to_struct(daily_reward, global.shops.dlc.mines_pack.upgrade_attributes.daily_reward_result);
    }
    if (is_dlc_purchase_valid(global.shops.dlc.gems_pack_uncommon.dlc_id) && is_dlc_claimed(global.shops.dlc.gems_pack_uncommon.key))
    {
        add_struct_to_struct(daily_reward, global.shops.dlc.gems_pack_uncommon.upgrade_attributes.daily_reward_result);
    }
    if (is_dlc_purchase_valid(global.shops.dlc.gems_pack_epic.dlc_id) && is_dlc_claimed(global.shops.dlc.gems_pack_epic.key))
    {
        add_struct_to_struct(daily_reward, global.shops.dlc.gems_pack_epic.upgrade_attributes.daily_reward_result);
    }
    if (is_dlc_purchase_valid(global.shops.dlc.gems_pack_legendary.dlc_id) && is_dlc_claimed(global.shops.dlc.gems_pack_legendary.key))
    {
        add_struct_to_struct(daily_reward, global.shops.dlc.gems_pack_legendary.upgrade_attributes.daily_reward_result);
    }
    if (global.cloud_data.is_season)
    {
        struct_merge(daily_reward, global.cloud_data.daily_reward);
    }
    var daily_reward_multiplier = get_upgrade_attribute_value(global.upgrade_attributes.daily_reward_multiplier);
    if (daily_reward_multiplier > 0)
    {
        daily_reward = multiply_struct_values(daily_reward, 1 + daily_reward_multiplier);
    }
    return daily_reward;
}
