function build_riddle(arg0)
{
    var gems = 10;
    var riddle = [new Gui_Item(UnknownEnum.Value_54, id, 
    {
        text: arg0.text
    }), new Gui_Item(UnknownEnum.Value_27, id, 
    {
        digits_only: get_default_struct_value(arg0, "digits_only", false),
        gems: gems,
        label_id: "pub_riddle",
        label: __("Solution"),
        riddle_id: arg0.riddle_id,
        solution: !is_array(arg0.solution) ? [arg0.solution] : arg0.solution,
        solve_func: get_default_struct_value(arg0, "solve_func", __void),
        tab_index: 0,
        
        change: function(arg0)
        {
            if (!is_undefined(variable_struct_get(o_game.data.stats.riddles, self.riddle_id)))
            {
                exit;
            }
            var solved = false;
            var __array = self.solution;
            var __prop_len = array_length(__array);
            for (var __i = 0; __i < __prop_len; __i++)
            {
                var mitem = __array[__i];
                if (string_lower(arg0) != string_lower(mitem))
                {
                    continue;
                }
                solved = true;
                break;
            }
            if (!solved)
            {
                exit;
            }
            variable_struct_set(o_game.data.stats.riddles, self.riddle_id, 1);
            add_resources(
            {
                gems: self.gems
            });
            self.solve_func();
        }
    }), new Gui_Item(UnknownEnum.Value_5, id, 
    {
        button_text: __("Back"),
        _open_instance_dialog: [object_index, "actions_riddles"]
    }), new Gui_Item(UnknownEnum.Value_51, id), new Gui_Item(UnknownEnum.Value_54, id, 
    {
        gems: gems,
        riddle_id: arg0.riddle_id,
        solution: arg0.solution,
        solution_text_add: get_default_struct_value(self, "solution_text_add", ""),
        
        text: function()
        {
            if (is_undefined(variable_struct_get(o_game.data.stats.riddles, self.riddle_id)))
            {
                return "";
            }
            var solution = is_array(self.solution) ? self.solution[0] : self.solution;
            var solve_text = [__s("You've solved the riddle! Respect, my brother, here are %s gems!", self.gems), __s("The answer was %s", solution)];
            if (!is_empty(self.solution_text_add))
            {
                array_push(solve_text, self.solution_text_add);
            }
            return implode("\n\n", solve_text);
        }
    })];
    return riddle;
}

enum UnknownEnum
{
    Value_5 = 5,
    Value_27 = 27,
    Value_51 = 51,
    Value_54 = 54
}
