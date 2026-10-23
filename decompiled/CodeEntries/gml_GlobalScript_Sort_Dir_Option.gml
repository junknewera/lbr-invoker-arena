function Sort_Dir_Option(arg0, arg1 = undefined) : Option(arg0, arg1) constructor
{
    options = [
    {
        value: "asc",
        text: __("Ascending")
    }, 
    {
        value: "desc",
        text: __("Descending")
    }];
    visible_in_options = false;
}
