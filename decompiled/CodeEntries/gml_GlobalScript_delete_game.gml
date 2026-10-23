function delete_game()
{
    global.trades = [];
    if (file_exists("save.dat"))
    {
        file_delete("save.dat");
    }
    if (file_exists("options.dat"))
    {
        file_delete("options.dat");
    }
    if (steam_file_exists("options.dat"))
    {
        steam_file_delete("options.dat");
    }
    if (steam_file_exists("save.dat"))
    {
        steam_file_delete("save.dat");
    }
    if (file_exists("apple-email.txt"))
    {
        file_delete("apple-email.txt");
    }
}
