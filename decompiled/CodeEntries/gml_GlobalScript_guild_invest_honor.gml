function guild_invest_honor(arg0)
{
    global.tmp_invest_honor = arg0;
    dec_resources(
    {
        honor: arg0
    });
    var data = 
    {
        honor: arg0,
        honor_data: base64_encode(json_stringify(global.resources.honor.data))
    };
    post_to_cloud("guild", "invest_honor", data, function(arg0)
    {
        notify(arg0.text);
        save_game();
    }, function(arg0)
    {
        if (is_struct(arg0) && !is_undefined(struct_get_from_hash(arg0, variable_get_hash("error"))))
        {
            notify_error(arg0.error);
            if (is_undefined(struct_get_from_hash(arg0, variable_get_hash("set_resources"))))
            {
                add_resources(
                {
                    honor: global.tmp_invest_honor
                }, false, true);
            }
        }
        else
        {
            notify_error(arg0);
            add_resources(
            {
                honor: global.tmp_invest_honor
            }, false, true);
        }
    });
}
