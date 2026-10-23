function Card_Pack(arg0) : Collectable_Usable_Object(arg0) constructor
{
    name = "";
    index = 0;
    btn_bg_sprite = spr_card_common;
    sprite = spr_placeholder;
    unlocked = true;
    card_parts_compensation = 0;
    cards_count = 1;
    cards_rarity = 
    {
        common: 100
    };
    cards_guarantee = {};
    cost_parts = 
    {
        card_parts: 1
    };
    
    init = function()
    {
        self.card_parts_compensation = floor(self.cost_parts.card_parts / 10);
    };
    
    can_buy = function(arg0, arg1 = false, arg2 = 1)
    {
        if (in_challenge() && !global.game_settings.gem_upgrades_enabled)
        {
            return false;
        }
        if (arg1)
        {
            var daily_data = get_daily_data_today();
            var cards_packs_bought_today = get_default_struct_value(daily_data.data, "cards_packs_bought", 0);
            if (((cards_packs_bought_today + arg2) - 1) >= global.game_settings.cards_packs_gem_purchases_per_day)
            {
                return false;
            }
        }
        return has_enough_resources(arg0);
    };
    
    buy = function(arg0, arg1 = false, arg2 = 1)
    {
        dec_resources(arg0);
        self.data.count += arg2;
        self.data.collected += arg2;
        if (arg1)
        {
            var daily_data = get_daily_data_today();
            add_to_struct_value(daily_data.data, "cards_packs_bought", arg2);
        }
    };
    
    can_open = function()
    {
        if (self.data.count <= 0)
        {
            return false;
        }
        return true;
    };
    
    get_available_cards_pack_count = function()
    {
        var available_cards_count = 0;
        var __array = self.cards_rarity;
        var __prop_len = array_length(__array);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mitem = __array[__i];
            var cards = get_available_cards(mitem.type, false);
            available_cards_count += array_length(cards);
        }
        return available_cards_count;
    };
    
    open = function(arg0 = 1, arg1 = true, arg2 = false, arg3 = false)
    {
        var auto_transcend = get_option(global.options.cards_auto_transcend);
        var cards = {};
        var guarantee_rarity = array_last(self.cards_rarity);
        var result = {};
        sort_array_by(self.cards_rarity, "chance", true);
        var count_before = arg0;
        var multiplier = 0;
        if (arg0 >= 1000)
        {
            multiplier = arg0 / 1000;
            arg0 = 1000;
        }
        repeat (arg0)
        {
            if (self.data.count == 0)
            {
                break;
            }
            var cards_current_pack = {};
            __struct = self.cards_guarantee;
            __prop_names = struct_get_names(__struct);
            __prop_len = array_length(__prop_names);
            for (var __i = 0; __i < __prop_len; __i++)
            {
                var mkey = __prop_names[__i];
                var mitem = variable_struct_get(__struct, mkey);
                repeat (mitem)
                {
                    var card = get_random_available_card(variable_struct_get(global.cards_types, mkey), false, true);
                    if (!is_struct(card))
                    {
                        break;
                    }
                    add_to_struct_value(cards_current_pack, card.key, 1);
                }
            }
            var cards_count_remaining = self.cards_count - get_struct_sum(cards_current_pack, "", "");
            repeat (cards_count_remaining)
            {
                var type = guarantee_rarity.type;
                var __array = self.cards_rarity;
                __prop_len = array_length(__array);
                for (var __i = 0; __i < __prop_len; __i++)
                {
                    var mitem = __array[__i];
                    if (!percent_chance(mitem.chance))
                    {
                        continue;
                    }
                    type = mitem.type;
                    break;
                }
                var card = get_random_available_card(type, false, true);
                if (!is_struct(card))
                {
                    break;
                }
                add_to_struct_value(cards_current_pack, card.key, 1);
            }
            struct_merge(cards, cards_current_pack);
        }
        if (multiplier > 0)
        {
            cards = multiply_struct_values(cards, multiplier, true);
        }
        var cards_diff = 0;
        var __struct = cards;
        var __prop_names = struct_get_names(__struct);
        var __prop_len = array_length(__prop_names);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mkey = __prop_names[__i];
            var mitem = variable_struct_get(__struct, mkey);
            var card = variable_struct_get(global.cards, mkey);
            card.last_transcension_count = 0;
            if ((card.data.count + mitem) > card.max_count())
            {
                var card_count_before = card.data.count;
                var card_add_count_before = variable_struct_get(cards, mkey);
                if (auto_transcend && !card.data.locked)
                {
                    var card_count_added = card.data.count + mitem;
                    var transcend_count = card.get_transcend_cards_count();
                    var transcend_level_before = card.data.transcended;
                    if (card_count_added >= transcend_count)
                    {
                        var transcend_count_max = card.get_max_transcend_count(mitem);
                        if (transcend_count_max > 0)
                        {
                            card.last_transcension_count_pack = 0;
                            card.data.count += variable_struct_get(cards, mkey);
                            card.transcend(transcend_count_max, true);
                            variable_struct_set(cards, mkey, min(card.data.count, card.max_count()));
                        }
                        else
                        {
                            variable_struct_set(cards, mkey, card.max_count() - card.data.count);
                        }
                    }
                }
                else
                {
                    cards_diff += ((card.data.count + mitem) - card.max_count());
                    variable_struct_set(cards, mkey, card.max_count() - card.data.count);
                }
            }
        }
        if (cards_diff > 0)
        {
            if (is_undefined(struct_get_from_hash(result, variable_get_hash("resources"))))
            {
                result.resources = 
                {
                    card_parts: 0
                };
            }
            result.resources.card_parts += cards_diff * self.card_parts_compensation;
        }
        result.cards = cards;
        self.data.count -= count_before;
        if (arg1)
        {
            var add_text = "";
            if (!is_undefined(struct_get_from_hash(result, variable_get_hash("resources"))))
            {
                add_text = __s("%s %s %s been compensated for %s.", number_format(cards_diff), pluralize(cards_diff, __("Card"), __("Cards")), pluralize(cards_diff, __("has"), __("have")), format_resources_text(result.resources));
                add_text += "\n";
            }
            add_result(result, add_text, undefined, !get_option(global.options.show_reward_dialogs), arg2, "cards");
            if (!get_option(global.options.show_reward_dialogs))
            {
                notify(__s("%s %s opened.", count_before, pluralize(count_before, __("item"), __("items"))));
            }
        }
        if (arg3)
        {
            return result;
        }
        return cards;
    };
    
    set_local_vars(arg0);
    set_sprite_data(self);
    init();
}
