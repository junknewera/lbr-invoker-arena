function get_empty_profile_data(arg0)
{
    var profile_data = 
    {
        areas: {},
        artifacts: {},
        banks: {},
        booster: {},
        booster_game: {},
        borbventure: {},
        cards: {},
        cards_packs: {},
        chests: {},
        converters: {},
        crafted_backpack: [],
        crafted_leaves: [],
        dice: [],
        dice_backpack: [],
        dice_enemies: {},
        enemies: {},
        equipment: {},
        events: {},
        fishing: {},
        harbor: {},
        key: arg0,
        leafscenders: {},
        master_relics: {},
        materials: {},
        milestones: {},
        mine_inventory: {},
        mines: {},
        objects: {},
        pets: {},
        player: {},
        quests: {},
        recipes: {},
        relics: {},
        resources: {},
        scrolls: {},
        shadow: 
        {
            crystal: {},
            player: {},
            tree: {}
        },
        shops: {},
        time: get_time_object(),
        trades: [],
        transmuters: {},
        unique_leaves: {}
    };
    return struct_clone(profile_data);
}
