function init_loadouts()
{
    global.loadouts = 
    {
        options: [
        {
            key: "weapon",
            sprite: spr_weapon_leaf_blower,
            tooltip: __("Tool")
        }, 
        {
            key: "pets",
            sprite: spr_pet_dog,
            tooltip: __("Pets")
        }, 
        {
            key: "unique_leaves",
            sprite: spr_leaf_unique_fire,
            tooltip: __("Unique Leaves")
        }, 
        {
            key: "scrolls",
            sprite: spr_scroll_damage,
            tooltip: __("Scrolls")
        }, 
        {
            key: "crafting",
            sprite: spr_icon_crafting,
            tooltip: __("Crafting")
        }, 
        {
            key: "autobuy",
            sprite: spr_icon_bot,
            tooltip: __("Autobuy priorities")
        }, 
        {
            key: "dice",
            sprite: spr_icon_die,
            tooltip: __("Dice")
        }, 
        {
            key: "nature",
            sprite: spr_plant_primula,
            tooltip: __("Nature Season")
        }, 
        {
            key: "alchemy",
            sprite: spr_icon_alchemy,
            tooltip: __("Alchemy (autobrew)")
        }, 
        {
            key: "harbor",
            sprite: spr_icon_ship,
            tooltip: __("Harbor")
        }]
    };
}

function load_loadout(arg0)
{
    var set = variable_struct_get(o_game.data.loadouts, arg0);
    if (!is_struct(set))
    {
        exit;
    }
    if (!is_undefined(struct_get_from_hash(set, variable_get_hash("alchemy"))) && get_default_struct_value(variable_struct_get(o_game.data.loadouts_options, arg0), "alchemy", true))
    {
        load_alchemy_loadout(set.alchemy);
    }
    if (!is_undefined(struct_get_from_hash(set, variable_get_hash("autobuy_priorities"))) && get_default_struct_value(variable_struct_get(o_game.data.loadouts_options, arg0), "autobuy_priorities", true))
    {
        load_autobuy_priorities(set.autobuy_priorities);
    }
    if (!is_undefined(struct_get_from_hash(set, variable_get_hash("crafting"))) && get_default_struct_value(variable_struct_get(o_game.data.loadouts_options, arg0), "crafting", true))
    {
        load_craft_set(set.crafting, false);
    }
    if (!is_undefined(struct_get_from_hash(set, variable_get_hash("dice"))) && get_default_struct_value(variable_struct_get(o_game.data.loadouts_options, arg0), "dice", true))
    {
        load_dice_loadout(set.dice);
    }
    if (!is_undefined(struct_get_from_hash(set, variable_get_hash("harbor"))) && get_default_struct_value(variable_struct_get(o_game.data.loadouts_options, arg0), "harbor", true))
    {
        load_harbor_loadout(set.harbor);
    }
    if (!is_undefined(struct_get_from_hash(set, variable_get_hash("nature"))) && get_default_struct_value(variable_struct_get(o_game.data.loadouts_options, arg0), "nature", true))
    {
        load_nature_loadout(set.nature);
    }
    if (!is_undefined(struct_get_from_hash(set, variable_get_hash("pets"))) && get_default_struct_value(variable_struct_get(o_game.data.loadouts_options, arg0), "pets", true))
    {
        load_pet_team(set.pets, false);
    }
    if (!is_undefined(struct_get_from_hash(set, variable_get_hash("scrolls"))) && get_default_struct_value(variable_struct_get(o_game.data.loadouts_options, arg0), "scrolls", true))
    {
        load_scrolls_loadout(set.scrolls, false);
    }
    if (!is_undefined(struct_get_from_hash(set, variable_get_hash("unique_leaves"))) && get_default_struct_value(variable_struct_get(o_game.data.loadouts_options, arg0), "unique_leaves", true))
    {
        load_unique_leaves_loadout(set.unique_leaves);
    }
    if (!is_undefined(struct_get_from_hash(set, variable_get_hash("weapon"))) && get_default_struct_value(variable_struct_get(o_game.data.loadouts_options, arg0), "weapon", true))
    {
        change_blower(set.weapon);
    }
    if (!is_undefined(struct_get_from_hash(set, variable_get_hash("weapon_alb"))) && get_default_struct_value(variable_struct_get(o_game.data.loadouts_options, arg0), "weapon_alb", true))
    {
        change_alb_blower(set.weapon_alb);
    }
    init_game_vars(true);
}

function save_loadout(arg0)
{
    variable_struct_set(o_game.data.loadouts, arg0, 
    {
        alchemy: get_default_struct_value(variable_struct_get(o_game.data.loadouts_options, arg0), "alchemy", true) ? get_alchemy_loadout() : undefined,
        autobuy_priorities: get_default_struct_value(variable_struct_get(o_game.data.loadouts_options, arg0), "autobuy", true) ? get_autobuy_priorities() : undefined,
        crafting: get_default_struct_value(variable_struct_get(o_game.data.loadouts_options, arg0), "crafting", true) ? get_craft_set() : undefined,
        dice: get_default_struct_value(variable_struct_get(o_game.data.loadouts_options, arg0), "dice", true) ? get_dice_loadout() : undefined,
        harbor: get_default_struct_value(variable_struct_get(o_game.data.loadouts_options, arg0), "harbor", true) ? get_harbor_loadout() : undefined,
        nature: get_default_struct_value(variable_struct_get(o_game.data.loadouts_options, arg0), "nature", true) ? get_nature_loadout() : undefined,
        pets: get_default_struct_value(variable_struct_get(o_game.data.loadouts_options, arg0), "pets", true) ? get_pet_team_array() : undefined,
        scrolls: get_default_struct_value(variable_struct_get(o_game.data.loadouts_options, arg0), "scrolls", true) ? get_scrolls_loadout() : undefined,
        unique_leaves: get_default_struct_value(variable_struct_get(o_game.data.loadouts_options, arg0), "unique_leaves", true) ? get_unique_leaves_loadout() : undefined,
        weapon: get_default_struct_value(variable_struct_get(o_game.data.loadouts_options, arg0), "weapon", true) ? o_game.data.current_weapon_key : undefined,
        weapon_alb: get_default_struct_value(variable_struct_get(o_game.data.loadouts_options, arg0), "weapon_alb", true) ? o_game.data.current_alb_weapon_key : undefined
    });
}

function load_alchemy_loadout(arg0)
{
    if (!is_struct(arg0))
    {
        exit;
    }
    var __struct = arg0;
    var __prop_names = struct_get_names(__struct);
    var __prop_len = array_length(__prop_names);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mkey = __prop_names[__i];
        var mitem = variable_struct_get(__struct, mkey);
        var recipe = variable_struct_get(global.recipes, mkey);
        if (!is_struct(recipe))
        {
            continue;
        }
        recipe.data.autouse = mitem;
    }
}

function get_alchemy_loadout()
{
    var loadout = {};
    var __struct = global.recipes;
    var __prop_names = struct_get_names(__struct);
    var __prop_len = array_length(__prop_names);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mkey = __prop_names[__i];
        var mitem = variable_struct_get(__struct, mkey);
        variable_struct_set(loadout, mkey, mitem.data.autouse);
    }
    return loadout;
}

function load_scrolls_loadout(arg0, arg1 = true)
{
    var is_position = false;
    var team = arg0;
    if (is_numeric(arg0))
    {
        is_position = true;
        team = variable_struct_get(o_game.data.scrolls_teams, arg0);
    }
    if (!is_array(team))
    {
        exit;
    }
    var __struct = global.scrolls;
    var __prop_names = struct_get_names(__struct);
    var __prop_len = array_length(__prop_names);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mkey = __prop_names[__i];
        var mitem = variable_struct_get(__struct, mkey);
        mitem.data.autouse = false;
    }
    var __array = team;
    __prop_len = array_length(__array);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mitem = __array[__i];
        var item = variable_struct_get(global.scrolls, mitem);
        if (!is_struct(item))
        {
            continue;
        }
        item.data.autouse = true;
    }
    if (arg1 && is_position)
    {
        notify(sprintf(__("Scroll team %s loaded."), sprintf("#%s", arg0 + 1)));
    }
}

function save_scrolls_loadout(arg0)
{
    var team = get_scrolls_loadout();
    variable_struct_set(o_game.data.scrolls_teams, arg0, team);
}

function get_scrolls_loadout()
{
    var loadout = [];
    var __array = global.scrolls_sorted;
    var __prop_len = array_length(__array);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mitem = __array[__i];
        if (mitem.data.autouse)
        {
            array_push(loadout, mitem.key);
        }
    }
    return loadout;
}

function get_dice_loadout()
{
    var loadout = 
    {
        backpack: [],
        inventory: []
    };
    var __array = global.dice_backpack;
    var __prop_len = array_length(__array);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mitem = __array[__i];
        array_push(loadout.backpack, mitem.data.id);
    }
    __array = global.dice_inventory;
    __prop_len = array_length(__array);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mitem = __array[__i];
        array_push(loadout.inventory, mitem.data.id);
    }
    return loadout;
}

function load_dice_loadout(arg0)
{
    if (!is_struct(arg0))
    {
        exit;
    }
    if (!is_array(struct_get_from_hash(arg0, variable_get_hash("backpack"))) || !is_array(struct_get_from_hash(arg0, variable_get_hash("inventory"))))
    {
        exit;
    }
    var __array = arg0.inventory;
    var __prop_len = array_length(__array);
    var __i = __prop_len - 1;
    while (__i >= 0)
    {
        var mitem = __array[__i];
        var __ireal = __prop_len - 1 - __i;
        if (!die_exists_by_id(mitem))
        {
            array_delete(arg0.inventory, __i, 1);
        }
        __i--;
    }
    __array = arg0.backpack;
    __prop_len = array_length(__array);
    __i = __prop_len - 1;
    while (__i >= 0)
    {
        var mitem = __array[__i];
        var __ireal = __prop_len - 1 - __i;
        if (!die_exists_by_id(mitem))
        {
            array_delete(arg0.backpack, __i, 1);
        }
        __i--;
    }
    var bp_size = get_dice_backpack_size();
    var inv_size = get_dice_inventory_size();
    var bp_set_size = array_length(global.dice_backpack);
    var bp_inv_size = array_length(global.dice_inventory);
    var saved_set_inv_size = array_length(arg0.inventory);
    var dice_size = bp_set_size + bp_inv_size;
    var check_overload_size = (dice_size - saved_set_inv_size) > bp_size;
    if (bp_size < bp_set_size || inv_size < bp_inv_size || check_overload_size)
    {
        return notify(__("Can't load set as backpack/inventory size is too small."));
    }
    __array = global.dice_inventory;
    __prop_len = array_length(__array);
    __i = __prop_len - 1;
    while (__i >= 0)
    {
        var mitem = __array[__i];
        var __ireal = __prop_len - 1 - __i;
        move_array_item(mitem, global.dice_inventory, global.dice_backpack);
        mitem.bag = "backpack";
        __i--;
    }
    __array = arg0.inventory;
    __prop_len = array_length(__array);
    __i = __prop_len - 1;
    while (__i >= 0)
    {
        var mitem = __array[__i];
        var __ireal = __prop_len - 1 - __i;
        var item = get_die_in_inventory_by_id(mitem, "backpack");
        if (!is_struct(item))
        {
            log("invalid dice", mitem);
        }
        else
        {
            move_array_item(item, global.dice_backpack, global.dice_inventory);
            item.bag = "inventory";
        }
        __i--;
    }
    var found_bp = [];
    var found_inv = [];
    __array = global.dice_inventory;
    __prop_len = array_length(__array);
    __i = __prop_len - 1;
    while (__i >= 0)
    {
        var mitem = __array[__i];
        var __ireal = __prop_len - 1 - __i;
        var dup = get_die_in_inventory_by_id(mitem.data.id, "backpack");
        if (is_struct(dup))
        {
            array_push(found_bp, mitem.data.id);
        }
        var __array2 = global.dice_inventory;
        var __prop_len2 = array_length(__array2);
        var __i2 = __prop_len2 - 1;
        while (__i2 >= 0)
        {
            var mitem2 = __array2[__i2];
            if (__i >= __i2)
            {
            }
            else if (mitem.data.id == mitem2.data.id)
            {
                array_push(found_inv, mitem.data.id);
            }
            __i2--;
        }
        __i--;
    }
    __array = found_bp;
    __prop_len = array_length(__array);
    for (__i = 0; __i < __prop_len; __i++)
    {
        var mitem = __array[__i];
        remove_item_from_array_by_id(global.dice_backpack, mitem);
    }
    __array = found_inv;
    __prop_len = array_length(__array);
    for (__i = 0; __i < __prop_len; __i++)
    {
        var mitem = __array[__i];
        remove_item_from_array_by_id(global.dice_inventory, mitem);
    }
}

function get_nature_loadout()
{
    var plants = [];
    var butterflies = [];
    var max_fields = 10;
    for (var i = 0; i < max_fields; i++)
    {
        var field = get_plant_field(i);
        array_push(plants, field.has_plant ? field.item.key : "");
        array_push(butterflies, field.has_butterfly ? field.butterfly.key : "");
    }
    return 
    {
        butterflies: butterflies,
        plants: plants
    };
}

function load_nature_loadout(arg0)
{
    var __array = arg0.butterflies;
    var __prop_len = array_length(__array);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mitem = __array[__i];
        if (!is_string(mitem) || is_empty(mitem))
        {
            continue;
        }
        var res = variable_struct_get(global.resources, mitem);
        if (!is_struct(res))
        {
            continue;
        }
        var field = get_plant_field(__i);
        if (field.has_butterfly && field.butterfly.key != mitem && field.butterfly.data.count > 0)
        {
            global.season_pass.nature.remove_plant(__i, 0, global.resource_types.butterfly);
            field.has_butterfly = false;
        }
        if (res.data.count > 0)
        {
            global.season_pass.nature.plant(res, field);
        }
    }
    __array = arg0.plants;
    __prop_len = array_length(__array);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mitem = __array[__i];
        if (!is_string(mitem) || is_empty(mitem))
        {
            continue;
        }
        var res = variable_struct_get(global.resources, mitem);
        if (!is_struct(res))
        {
            continue;
        }
        var field = get_plant_field(__i);
        if (field.has_plant && field.item.key != mitem && field.item.data.count > 0)
        {
            global.season_pass.nature.remove_plant(field.index, 0, global.resource_types.plant);
            field.has_plant = false;
        }
        if (res.data.count > 0)
        {
            global.season_pass.nature.plant(res, field);
        }
    }
}

function get_harbor_loadout()
{
    var loadout = [];
    var __array = global.harbor_inventory.inventory;
    var __prop_len = array_length(__array);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mitem = __array[__i];
        array_push(loadout, mitem.key);
    }
    return loadout;
}

function load_harbor_loadout(arg0)
{
    if (!is_array(arg0))
    {
        exit;
    }
    var inv = global.harbor_inventory;
    var __array = inv.inventory;
    var __prop_len = array_length(__array);
    var __i = __prop_len - 1;
    while (__i >= 0)
    {
        var mitem = __array[__i];
        var __ireal = __prop_len - 1 - __i;
        inv.move_item(mitem, false);
        __i--;
    }
    __array = arg0;
    __prop_len = array_length(__array);
    for (__i = 0; __i < __prop_len; __i++)
    {
        var mitem = __array[__i];
        var item = inv.get_item(mitem);
        if (is_struct(item) && item.data.bag == "backpack")
        {
            inv.move_item(item, true);
        }
    }
}
