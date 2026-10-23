function autosave_backup()
{
    if (global.cloud_data.is_season)
    {
        exit;
    }
    if (file_exists("save.dat") && is_save_valid("save.dat"))
    {
        notify(__("Game saved."));
        file_copy("save.dat", sprintf("%s-1", "save.dat"));
    }
    else
    {
        notify_error(__("Invalid save file."));
    }
}

function get_file_contents(arg0)
{
    if (!file_exists(arg0))
    {
        return "";
    }
    var data = "";
    var fs = file_text_open_read(arg0);
    while (!file_text_eof(fs))
    {
        data += file_text_read_string(fs);
        file_text_readln(fs);
    }
    file_text_close(fs);
    return data;
}

function get_hashed_content(arg0)
{
    var content = get_file_contents(arg0);
    var content_parsed = parse_save_data(content);
    return content_parsed;
}

function get_save_filename_custom()
{
    return global.cloud_data.is_season ? "save-season.dat" : "save.dat";
}

function is_save_valid(arg0)
{
    return is_struct(get_hashed_content(arg0));
}

function is_valid_json_file(arg0)
{
    var content = get_file_contents(arg0);
    var content_parsed = undefined;
    try
    {
        content_parsed = json_parse(content);
    }
    catch (err)
    {
    }
    return is_struct(content_parsed);
}

function point_to_object(arg0)
{
    if (!instance_exists(arg0))
    {
        return 0;
    }
    return point_direction(x, y, arg0.x, arg0.y);
}

function read_json_file(arg0)
{
    var content = get_file_contents(arg0);
    try
    {
        var data = json_parse(content);
        return data;
    }
    catch (err)
    {
        log("Invalid json", arg0, err);
        return {};
    }
}
