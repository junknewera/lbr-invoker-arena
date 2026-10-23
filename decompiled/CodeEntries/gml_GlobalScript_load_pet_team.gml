function load_pet_team(arg0, arg1 = true)
{
    var is_position = false;
    var team = arg0;
    if (is_numeric(arg0))
    {
        is_position = true;
        team = variable_struct_get(o_game.data.pet_teams, arg0);
    }
    if (!is_array(team))
    {
        exit;
    }
    if (is_position)
    {
        o_game.data.current_pet_team = arg0;
    }
    var __struct = global.pets;
    var __prop_names = struct_get_names(__struct);
    var __prop_len = array_length(__prop_names);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mkey = __prop_names[__i];
        var mitem = variable_struct_get(__struct, mkey);
        mitem.deactivate();
    }
    var __array = team;
    __prop_len = array_length(__array);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mitem = __array[__i];
        var pet = variable_struct_get(global.pets, mitem);
        var pet_shop = variable_struct_get(global.shops.pets, "pet_" + mitem);
        if (is_undefined(pet) || is_undefined(pet_shop))
        {
            continue;
        }
        if (pet_shop.data.count == 0)
        {
            continue;
        }
        pet.activate();
    }
    if (arg1 && is_position)
    {
        notify(__s("Pet team %s loaded.", arg0 + 1));
    }
}
