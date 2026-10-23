function set_input_status(arg0, arg1)
{
    with (o_game)
    {
        draw_info_deactivate();
        if (input_status == arg0 && info_tab == arg1)
        {
            input_status = UnknownEnum.Value_0;
        }
        else
        {
            input_status = arg0;
            info_tab = arg1;
        }
        if (input_status == UnknownEnum.Value_2)
        {
            if (info_tab == UnknownEnum.Value_0)
            {
                draw_info_activate();
            }
        }
    }
}

enum UnknownEnum
{
    Value_0,
    Value_2 = 2
}
