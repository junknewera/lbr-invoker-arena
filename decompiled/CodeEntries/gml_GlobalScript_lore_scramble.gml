function lore_scramble(arg0)
{
    if (!o_game.data.stats.pub_lore_text_riddle_solved)
    {
        return string_shuffle(arg0, "leaf");
    }
    return arg0;
}
