function Gui_Item(arg0, arg1 = -1, arg2 = undefined, arg3 = undefined) constructor
{
    args = "";
    button_args = "";
    button_options = undefined;
    _button_text = "";
    button_text = "";
    button_tooltip = "";
    buy_max = true;
    _check = __return_true;
    check = true;
    check_args = "";
    description = "";
    description_add = "";
    _description = "";
    _description_add = "";
    draw_fav = false;
    
    _func_before = function()
    {
        self.func_before();
    };
    
    _func = __void;
    _func_after = __void;
    func_before = __void;
    func = __void;
    func_after = __void;
    gui_item = self;
    hotkey = false;
    instance = iif(is_undefined(arg1), -1, arg1);
    is_hidden_until_bought = false;
    is_obfuscated = false;
    
    _is_visible = function()
    {
        return true;
    };
    
    is_visible = true;
    item_id = 0;
    item_index = 0;
    item = false;
    __item = arg2;
    label_id = -1;
    link = "";
    _open_instance_dialog = undefined;
    resource = -1;
    section = global.dialog_sections.general.general;
    text_args = "";
    _text = "";
    text = "";
    type = arg0;
    
    use = function()
    {
    };
    
    if (is_struct(arg2))
    {
        var _props_names = variable_struct_get_names(arg2);
        for (var i = 0; i < array_length(_props_names); i++)
        {
            variable_struct_set(self, @@array_get@@(_props_names, i), variable_struct_get(arg2, @@array_get@@(_props_names, i)));
        }
    }
    _button_text = maybe_add_method(self, button_text);
    _check = maybe_add_method(self, check);
    _description = maybe_add_method(self, description);
    _func = maybe_add_method(self, func);
    _func_after = maybe_add_method(self, func_after);
    _is_obfuscated = maybe_add_method(self, is_obfuscated);
    _is_visible = maybe_add_method(self, is_visible);
    _text = maybe_add_method(self, text);
    if (is_array(func) && array_length(func) > 1)
    {
        args = func[1];
    }
    if (!is_undefined(_open_instance_dialog))
    {
        _func_after = function()
        {
            open_instance_dialog(_open_instance_dialog[0], _open_instance_dialog[1]);
            self.func_after();
        };
    }
    
    _button_tooltip = function()
    {
        if (is_struct(self.__item.item) && array_length(self.__item.item.options) > 0)
        {
            var option = @@array_get@@(self.__item.item.options, self.__item.item.data.slider_value);
            return get_default_struct_value(option, "tooltip", option.text);
        }
    };
    
    if (is_struct(item))
    {
        var max_count = get_shop_item_max_count(item);
        if (max_count == 1)
        {
            buy_max = false;
        }
    }
    if (!is_undefined(arg3))
    {
        __item = arg3;
    }
}
