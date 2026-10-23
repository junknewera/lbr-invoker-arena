event_inherited();
autofocus = false;
digits_only = false;
btn_text_cancel = __("Cancel");
btn_text_confirm = __("Confirm");
label = "";
input_props = {};
input_props_final = 
{
    autofocus: autofocus,
    digits_only: digits_only,
    input: "",
    label_id: "input",
    tab_index: 0
};

init_after = function()
{
    shop_index = 0;
    shop_items_display = 6;
    apply_struct_to_struct(input_props_final, input_props);
    input_props_final.label = label;
    actions = [new Gui_Item(UnknownEnum.Value_54, id, 
    {
        text: text
    }), new Gui_Item(UnknownEnum.Value_27, id, input_props_final), new Gui_Item(UnknownEnum.Value_5, id, 
    {
        button_text: btn_text_cancel,
        button_options: 
        {
            icon: spr_icon_cancel
        },
        
        func: function()
        {
            call_method(self.instance, self.instance.func_cancel, self.instance.btn_args);
        },
        
        func_after: function()
        {
            call_method(self.instance, self.instance.func_cancel_after, self.instance.btn_args);
        }
    }), new Gui_Item(UnknownEnum.Value_5, id, 
    {
        button_text: btn_text_confirm,
        button_options: 
        {
            icon: spr_icon_check
        },
        
        func: function()
        {
            call_method(self.instance, self.instance.func_confirm, get_gui_input_value("input"));
        },
        
        func_after: function()
        {
            call_method(self.instance, self.instance.func_confirm_after, self.instance.btn_args);
        },
        
        hotkey: 32
    })];
    shop_index_max = array_length(actions) - shop_items_display;
};

enum UnknownEnum
{
    Value_5 = 5,
    Value_27 = 27,
    Value_54 = 54
}
