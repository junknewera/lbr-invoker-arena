event_inherited();
padding = gui_col_x(2);
playing = true;
play_ended = false;
slot_change_timer = sec(0.1);
slot_num = 3;
slots = [];
win_result = 
{
    resource: {},
    sprite: spr_solid,
    text: "",
    win: true
};
width = 224;
height = width;
leaves = get_slots_pool();
for (var i = 0; i < slot_num; i++)
{
    array_push(slots, array_random_item(leaves));
}
alarm[2] = slot_change_timer;
alarm[3] = iif(global.debug, sec(0.5), sec(1));
global.tavern_games_playing.slots = true;

shuffle_slots = function()
{
    var __array = slots;
    var __prop_len = array_length(__array);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mitem = __array[__i];
        slots[__i] = array_random_item(leaves);
        if (slots[__i].is_leaf)
        {
            var r = get_random_unlocked_resource(global.resources_leaves);
            slots[__i].leaf_value = r.prestige_value;
            slots[__i].sprite = r.sprite;
        }
    }
};
