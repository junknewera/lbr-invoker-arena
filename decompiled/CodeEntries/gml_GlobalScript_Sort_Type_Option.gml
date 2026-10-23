function Sort_Type_Option(arg0, arg1 = undefined) : Option(arg0, arg1) constructor
{
    options = [
    {
        value: UnknownEnum.Value_0,
        text: __("Rarity")
    }, 
    {
        value: UnknownEnum.Value_1,
        text: __("Type")
    }];
    visible_in_options = false;
}

enum UnknownEnum
{
    Value_0,
    Value_1
}
