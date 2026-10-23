function set_guild(arg0)
{
    if (is_undefined(global.cloud_data.guild))
    {
        global.cloud_data.guild = new Guild();
    }
    global.cloud_data.guild.load_data(arg0);
}
