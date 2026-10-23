function claim_dlc(arg0)
{
    if (!is_struct(arg0))
    {
        return log("=== INVALID DLC ITEM ===", arg0);
    }
    variable_struct_set(variable_struct_get(o_game.data.dlc_claimed, arg0.key), 0, true);
    arg0.data.count = 1;
    arg0.data.collected++;
    variable_struct_set(arg0.data.claimed_os, 0, true);
    if (is_struct(struct_get_from_hash(arg0, variable_get_hash("instant_result"))))
    {
        add_result_lite(arg0.instant_result);
    }
    arg0.func();
    global.resources.gems.data.unlocked = true;
}

function get_dlc_description(arg0)
{
    var texts = [];
    array_push(texts, get_default_struct_value(arg0, "description_prefix", ""));
    array_push(texts, "");
    if (is_struct(struct_get_from_hash(arg0, variable_get_hash("upgrade_attributes"))))
    {
        var upgrade_text = format_upgrade_text(arg0.upgrade_attributes, undefined, true, undefined, undefined, undefined, undefined, undefined, ["daily_reward_result", "daily_reward_borbventure_packs"]);
        if (!is_empty(upgrade_text))
        {
            array_push(texts, sprintf("* %s: %s", __("Upgrades"), upgrade_text));
        }
        if (is_struct(struct_get_from_hash(arg0.upgrade_attributes, variable_get_hash("daily_reward_result"))))
        {
            array_push(texts, sprintf("* %s: %s", __("Daily"), format_result_text(arg0.upgrade_attributes.daily_reward_result, "", ", ")));
        }
    }
    if (is_struct(struct_get_from_hash(arg0, variable_get_hash("instant_result"))))
    {
        array_push(texts, sprintf("* %s: %s", __("Instantly"), format_result_text(arg0.instant_result, "", ", ")));
    }
    if (arg0.supporters_tier > 0)
    {
        array_push(texts, "");
        array_push(texts, __s("Unlocks Tier %s Supporter Perks.", arg0.supporters_tier));
    }
    if (global.is_pc && get_default_struct_value(arg0, "is_iap", false))
    {
        array_push(texts, global.texts.steam_note_text);
    }
    array_push(texts, "");
    array_push(texts, get_default_struct_value(self, "description_suffix", ""));
    return string_trim(implode("\n", texts));
}

function get_supporter_tier()
{
    if (get_option(global.options.enable_supporter_upgrades))
    {
        for (var i = 2; i >= 0; i--)
        {
            var __array = variable_struct_get(global.supporter_tier_item_keys, i);
            var __prop_len = array_length(__array);
            for (var __i = 0; __i < __prop_len; __i++)
            {
                var mitem = __array[__i];
                var shop_item = variable_struct_get(global.shops.dlc, mitem);
                if (is_struct(shop_item) && !is_undefined(variable_struct_get(shop_item.data.claimed_os, 0)))
                {
                    return shop_item.supporters_tier;
                }
            }
        }
    }
    return UnknownEnum.Value_0;
}

function has_dlc_pack(arg0)
{
    return is_dlc_purchase_valid(arg0);
}

function is_dlc_claimed(arg0)
{
    var item = variable_struct_get(global.shops.dlc, arg0);
    if (!is_struct(item))
    {
        return false;
    }
    var claimed = get_default_struct_value(item.data.claimed_os, 0, false) || get_default_struct_value(variable_struct_get(o_game.data.dlc_claimed, item.key), 0, false);
    return claimed;
}

enum UnknownEnum
{
    Value_0
}
