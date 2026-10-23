event_inherited();
titles = 
{
    title: __("Bartender"),
    subtitle: __("Welcome to the Cheese Pub. We only serve beer and cheddar here.")
};
talk_text = "";

init_actions = function()
{
    actions = [new Gui_Item(UnknownEnum.Value_5, id, 
    {
        button_text: __("Talk"),
        
        func_before: function()
        {
            o_npc_quests_pub.talk_text = array_random_item(global.texts.bartender_talk);
        },
        
        _open_instance_dialog: [object_index, "actions_talk"]
    }), new Gui_Item(UnknownEnum.Value_5, id, 
    {
        button_text: __("Quests"),
        _open_instance_dialog: [object_index, "actions_quests"]
    }), new Gui_Item(UnknownEnum.Value_5, id, 
    {
        button_text: __("Riddles"),
        _open_instance_dialog: [object_index, "actions_riddles"],
        
        check: function()
        {
            return is_unlocked_gem_leaves();
        }
    })];
    actions_quests = [new Gui_Item(UnknownEnum.Value_38, id, 
    {
        quests: global.quests.bartender
    })];
    actions_talk = [new Gui_Item(UnknownEnum.Value_54, id, 
    {
        text: function()
        {
            return o_npc_quests_pub.talk_text;
        }
    }), new Gui_Item(UnknownEnum.Value_5, id, 
    {
        button_text: __("Back"),
        _open_instance_dialog: [object_index, "actions"]
    })];
    actions_riddles = [new Gui_Item(UnknownEnum.Value_5, id, 
    {
        button_text: __("Back"),
        _open_instance_dialog: [object_index, "actions"]
    }), new Gui_Item(UnknownEnum.Value_51, -1, 
    {
        height: 60
    })];
    var __array = global.riddles_array;
    var __prop_len = array_length(__array);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mitem = __array[__i];
        var riddle_id = string(__i + 1);
        array_push(actions_riddles, new Gui_Item(UnknownEnum.Value_6, id, 
        {
            button_text: __s("Riddle %s", "#" + riddle_id),
            _open_instance_dialog: [object_index, "actions_riddle" + riddle_id],
            riddle_id: riddle_id,
            
            text_below: function()
            {
                return is_undefined(variable_struct_get(o_game.data.stats.riddles, self.riddle_id)) ? "-" : __("Solved");
            }
        }));
        var actions_riddle_tmp = build_riddle(mitem);
        variable_instance_set(id, "actions_riddle" + riddle_id, actions_riddle_tmp);
    }
};

init_actions();

enum UnknownEnum
{
    Value_5 = 5,
    Value_6,
    Value_38 = 38,
    Value_51 = 51,
    Value_54 = 54
}
