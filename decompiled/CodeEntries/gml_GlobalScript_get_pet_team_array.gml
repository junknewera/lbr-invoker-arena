function get_pet_team_array()
{
    var team = [];
    var __array = global.pets_sorted;
    var __prop_len = array_length(__array);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mitem = __array[__i];
        if (mitem.data.active)
        {
            array_push(team, mitem.key);
        }
    }
    return team;
}
