function generate_house_item_id()
{
    var _id = o_game.data.stats.house_item_id_counter;
    o_game.data.stats.house_item_id_counter++;
    return _id;
}
