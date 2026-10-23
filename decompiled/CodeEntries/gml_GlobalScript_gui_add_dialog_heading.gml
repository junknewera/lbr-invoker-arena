function gui_add_dialog_heading(arg0, arg1, arg2)
{
    array_insert(arg0, 0, new Gui_Item(UnknownEnum.Value_54, id, 
    {
        text: arg2
    }));
    array_insert(arg0, 0, new Gui_Item(UnknownEnum.Value_56, id, 
    {
        text: arg1
    }));
}

enum UnknownEnum
{
    Value_54 = 54,
    Value_56 = 56
}
