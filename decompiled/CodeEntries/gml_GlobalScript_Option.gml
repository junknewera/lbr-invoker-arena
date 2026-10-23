function Option(arg0, arg1) constructor
{
    name = "";
    description = "";
    index = 0;
    key = "";
    await_input = false;
    await_input_single = false;
    button_text_affix = "";
    button_text_prefix = "";
    changed = false;
    checkbox_text = "";
    default_value = undefined;
    draw_inline = false;
    has_checkbox = false;
    has_clear_button = false;
    has_options = false;
    has_slider = false;
    hotkey_char = "";
    is_awaiting_input = false;
    is_hotkey = false;
    options = [];
    options_length = 0;
    reset_at_startup = false;
    section = global.dialog_sections.options.gameplay;
    slider_min = 0;
    slider_max = 100;
    slider_step = 10;
    sprite = undefined;
    toggle = false;
    tooltip = "";
    tooltip_struct = 
    {
        tooltip: tooltip
    };
    value_cache = undefined;
    visible_in_options = true;
    _data = 
    {
        checked: false,
        value: true
    };
    data = {};
    data_start = {};
    
    init = function()
    {
        self.data_start = struct_clone(self.data);
        self.default_value = get_default_struct_value(self.data, "value", undefined);
        self.options_length = array_length(self.options);
        self.has_options = self.options_length > 0;
        self.tooltip_struct.tooltip = self.tooltip;
    };
    
    init_late = __void;
    
    init_late_after = function()
    {
        self.options_length = array_length(self.options);
        self.has_options = self.options_length > 0;
    };
    
    add_draw = __void;
    
    _button_text = function()
    {
        if (self.await_input && self.is_awaiting_input)
        {
            return __("Enter hotkey...");
        }
        var text = "";
        if (is_string(self.button_text))
        {
            text = self.button_text;
        }
        else if (self.is_hotkey)
        {
            if (is_empty(self.data.value) || !is_numeric(self.data.value))
            {
                text = " ";
            }
            else if (!is_undefined(variable_struct_get(global.hotkey_map, self.data.value)))
            {
                text = variable_struct_get(global.hotkey_map, self.data.value);
            }
            else
            {
                text = chr(self.data.value);
            }
        }
        else
        {
            text = get_value_ext(self, self.button_text);
        }
        return sprintf("%s%s%s", self.button_text_prefix, text, self.button_text_affix);
    };
    
    button_text = function()
    {
        if (self.has_slider)
        {
            return self.data.value;
        }
        else if (is_string(self.data.value))
        {
            return self.data.value;
        }
        else if (self.options_length > 0 && self.data.value < self.options_length && is_struct(self.options[self.data.value]))
        {
            return self.options[self.data.value].text;
        }
        return self.data.value ? __("On") : __("Off");
    };
    
    _change = function(arg0 = false, arg1 = undefined)
    {
        self.changed = true;
        return self.change(arg0, arg1);
    };
    
    change = function(arg0 = false, arg1 = undefined)
    {
    };
    
    check = __return_true;
    
    click = function()
    {
    };
    
    check_is_visible_option = function(arg0)
    {
        var option_row = @@array_get@@(self.options, arg0);
        if (!is_struct(option_row))
        {
            return true;
        }
        var is_visible = get_value_ext(option_row, struct_get_from_hash(option_row, variable_get_hash("is_visible")));
        if (!is_bool(is_visible))
        {
            is_visible = true;
        }
        return is_visible;
    };
    
    _func = function(arg0 = false, arg1 = undefined)
    {
        var click_dir = get_click_dir();
        if (global.is_mobile)
        {
            click_dir = 1;
        }
        if (!is_undefined(arg1))
        {
            click_dir = arg1;
        }
        if (self.await_input)
        {
            if (self.is_awaiting_input)
            {
                delay("awaiting_input_delay", 5, function()
                {
                    global.is_awaiting_input = false;
                    global.awaiting_input_option.is_awaiting_input = false;
                });
                if (keyboard_lastkey == vk_tab)
                {
                    self.data.value = "";
                }
                if (!in_array(keyboard_lastkey, global.hotkeys_reserved) && is_numeric(keyboard_lastkey))
                {
                    self.data.value = keyboard_lastkey;
                    var __struct = global.options;
                    var __prop_names = struct_get_names(__struct);
                    var __prop_len = array_length(__prop_names);
                    for (var __i = 0; __i < __prop_len; __i++)
                    {
                        var mkey = __prop_names[__i];
                        var mitem = variable_struct_get(__struct, mkey);
                        if (mkey == self.key)
                        {
                            continue;
                        }
                        if (mitem.is_hotkey && mitem.data.value == self.data.value)
                        {
                            mitem.data.value = "";
                        }
                    }
                }
            }
            else
            {
                var __array = global.options_sorted;
                var __prop_len = array_length(__array);
                for (var __i = 0; __i < __prop_len; __i++)
                {
                    var mitem = __array[__i];
                    if (!mitem.await_input)
                    {
                        continue;
                    }
                    if (mitem.is_awaiting_input)
                    {
                        mitem.is_awaiting_input = false;
                    }
                }
                global.is_awaiting_input = true;
                global.awaiting_input_option = self;
                self.is_awaiting_input = true;
                exit;
            }
        }
        if (array_length(self.options) > 0)
        {
            self.data.value = self.get_next_option_value(click_dir);
        }
        if (self.toggle)
        {
            self.data.value = !self.data.value;
        }
        if (self.has_slider)
        {
            var inc_value = click_dir * self.slider_step;
            if (keyboard_check(vk_shift))
            {
                inc_value = sign(inc_value) * 10;
            }
            if (keyboard_check(vk_control))
            {
                inc_value = sign(inc_value) * 25;
            }
            if (keyboard_check(vk_alt))
            {
                inc_value = sign(inc_value) * 100;
            }
            self.data.value += inc_value;
            if (!is_undefined(self.slider_min))
            {
                self.data.value = max(self.slider_min, self.data.value);
            }
            if (!is_undefined(self.slider_max))
            {
                self.data.value = min(self.slider_max, self.data.value);
            }
        }
        self.func(arg0, self.data.value);
        self._change(arg0, self.data.value);
        self.func_after(arg0, self.data.value);
    };
    
    func = __void;
    func_after = __void;
    
    get_next_option_value = function(arg0 = 1)
    {
        var is_visible = false;
        var n = 0;
        var options_length = array_length(self.options);
        var options_length_wrap = options_length;
        var next_option_value = wrap(self.data.value, arg0, 0, options_length_wrap - 1);
        while (!is_visible && n < 100)
        {
            is_visible = self.check_is_visible_option(next_option_value);
            if (!is_visible)
            {
                next_option_value = wrap(next_option_value, arg0, 0, options_length_wrap);
            }
            n++;
        }
        return next_option_value;
    };
    
    get_option_value_index = function(arg0)
    {
        if (!self.has_options)
        {
            return arg0;
        }
        var __array = self.options;
        var __prop_len = array_length(__array);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mitem = __array[__i];
            if (is_struct(mitem) && mitem.value == arg0)
            {
                return __i;
            }
        }
        return 0;
    };
    
    get_value = function()
    {
        if (!self.changed && !is_undefined(self.value_cache))
        {
            return self.value_cache;
        }
        if (self.options_length > 0)
        {
            if (is_string(self.data.value))
            {
                var __array = self.options;
                var __prop_len = array_length(__array);
                for (var __i = 0; __i < __prop_len; __i++)
                {
                    var mitem = __array[__i];
                    if (is_struct(mitem) && mitem.value == self.data.value)
                    {
                        self.value_cache = __i;
                        return __i;
                    }
                }
                self.value_cache = 0;
                return 0;
            }
            if (self.data.value >= self.options_length)
            {
                self.data.value = 0;
            }
            var option_value = self.options[self.data.value];
            if (is_struct(option_value))
            {
                self.value_cache = option_value.value;
            }
            else
            {
                self.value_cache = self.options[self.data.value];
            }
        }
        else
        {
            self.value_cache = self.data.value;
        }
        return self.value_cache;
    };
    
    get_name = function()
    {
        return get_value_ext(self, self.name);
    };
    
    get_description = function()
    {
        return get_value_ext(self, self.description);
    };
    
    reset = function()
    {
        if (self.is_hotkey)
        {
            self.data.value = self.default_value;
            self.func();
        }
        else
        {
            self.data = struct_clone(self.data_start);
        }
    };
    
    set = function(arg0)
    {
        self.data.value = arg0;
    };
    
    set_local_vars(arg1);
    struct_apply_defaults(data, _data);
    draw = method(self, _draw_option);
    init();
}
