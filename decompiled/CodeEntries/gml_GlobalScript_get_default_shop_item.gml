function get_default_shop_item()
{
    return 
    {
        name: __("Shop Item"),
        description: "",
        sprite: spr_placeholder,
        sprite_image_index: 0,
        sprite_seed: spr_placeholder,
        cost: {},
        cost_cache_current: undefined,
        cost_cache_current_count: -1,
        cost_cache_highest: 0,
        cost_cache_reduced_price: false,
        cost_exp: 1.5,
        cost_qty_count: -1,
        cost_qty_1: -1,
        cost_qty_5: -1,
        cost_qty_10: -1,
        cost_qty_25: -1,
        cost_qty_100: -1,
        cost_qty_buy_max: -1,
        cost_qty_max: -1,
        can_buy_max: true,
        max_count: 1,
        
        get_max_count: function()
        {
            return self.max_count;
        },
        
        data: 
        {
            auto_upgrade_enabled: false,
            auto_upgrade_prio_user: 1,
            collected: 0,
            count: 0,
            inventory: 0,
            max_buy_user: -1,
            slider_value: 0,
            toggle: false,
            upgrade_level: 0
        },
        func: false,
        has_auto_upgrade: false,
        is_autobuyer: false,
        is_buyable: true,
        is_dlc: false,
        is_free: false,
        is_gem_upgrade: false,
        is_obfuscated: false,
        is_skin: false,
        is_slider: false,
        is_static: false,
        is_toggle: false,
        is_upgradable: false,
        is_usable: false,
        is_visible: true,
        maxed: false,
        add_to_inventory: false,
        auto_upgrade: "",
        auto_upgrade_check: true,
        auto_upgrade_shop: "",
        auto_upgrade_item_cache: false,
        auto_upgrade_prio: 0,
        can_buy: false,
        options: [],
        prestige_level: 0,
        reduce_inventory_on_use: true,
        resources: [],
        resources_sorted: [],
        slider_prefix: "",
        slider_affix: "",
        slider_format_number: false,
        slider_format_number_dec: 2,
        slider_min: 0,
        slider_max: 100,
        slider_step: 1,
        supporters_only: false,
        supporters_tier: UnknownEnum.Value_0,
        tag: global.shop_item_tags.unknown,
        upgrade_attributes: undefined,
        upgrade_attributes_apply_early: false,
        value: 0
    };
}

enum UnknownEnum
{
    Value_0
}
