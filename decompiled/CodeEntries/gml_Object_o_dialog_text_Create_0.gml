event_inherited();

init_after = function()
{
    shop_items_display = 6;
    actions = [new Gui_Item(UnknownEnum.Value_54, id, 
    {
        text: text
    }), new Gui_Item(UnknownEnum.Value_5, id, 
    {
        button_text: __("Aight"),
        
        func: function()
        {
            call_method(self.instance, self.instance.func_confirm);
        },
        
        func_after: function()
        {
            call_method(self.instance, self.instance.func_confirm_after);
        }
    })];
};

enum UnknownEnum
{
    Value_5 = 5,
    Value_54 = 54
}
