if (!global.debug)
{
    exit;
}
var n = 0;
var c = 5000;
var res = {};
var win_count = 0;
var lose_count = 0;
var pity_counter_win = 0;
var pity_counter = get_upgrade_attribute_value(global.upgrade_attributes.slots_pity_counter);
repeat (c)
{
    shuffle_slots();
    if (pity_counter > 0 && (n % (50 - pity_counter)) == 0)
    {
        var slot_item = slots[0];
        var __array = slots;
        var __prop_len = array_length(__array);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mitem = __array[__i];
            slots[__i] = slot_item;
        }
        pity_counter_win++;
    }
    var winres = get_slots_win_result(slots);
    if (winres.win)
    {
        win_count++;
        add_to_struct_value(res, winres.slot_value, 1);
    }
    else
    {
        lose_count++;
    }
    n++;
}
log("slot benchmark", "win", win_count, "lose", lose_count, "pity counter win", pity_counter_win, res);
