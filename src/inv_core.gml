// Invoker Arena core rules: pure state and numbers, no drawing or input polling. Times are in seconds.
// Numbers come from the installed Dota 2 data (npc_dota_hero_invoker.txt, npc_dota_hero_axe.txt, items.txt, npc_units.txt)
// and its tooltips (abilities_english.txt, dota_english.txt). Values marked "interpretation" are not in that data.

function inv_data()
{
    static data = {
        epsilon: 0.000001,
        invoke: { base_cooldown: 7, cooldown_per_orb_level: 0.3 },
        // Keys are the three orbs sorted alphabetically (e < q < w).
        combos: {
            qqq: "cold_snap", eqq: "ice_wall", qqw: "ghost_walk",
            www: "emp", qww: "tornado", eww: "alacrity",
            eee: "sun_strike", eeq: "forge_spirit", eew: "chaos_meteor",
            eqw: "deafening_blast"
        },
        spells: {
            cold_snap: { cooldown: 19, cooldown_talent: -6, values: {
                freeze_damage: { orb: "q", per_level: [28, 36, 44, 52, 60, 68, 76, 84, 92] },
                duration: { orb: "q", per_level: [3.0, 3.4, 3.8, 4.2, 4.6, 5.0, 5.4, 5.8, 6.2] },
                freeze_cooldown: { orb: "q", per_level: [0.80, 0.77, 0.74, 0.71, 0.68, 0.65, 0.62, 0.59, 0.56] },
                freeze_duration: { base: 0.4 },
                damage_trigger: { base: 10 },
                cast_range: { base: 1000 }
            } },
            ghost_walk: { cooldown: 40, cooldown_talent: 0, values: {
                duration: { base: 50 }
            } },
            tornado: { cooldown: 27, cooldown_talent: -5, values: {
                damage: { base: 50, orb: "w", per_level: [45, 90, 135, 180, 225, 270, 315, 360, 405] },
                lift_duration: { orb: "q", per_level: [1.2, 1.4, 1.6, 1.8, 2, 2.2, 2.4, 2.6, 2.8] },
                travel_distance: { orb: "w", per_level: [1500, 1800, 2100, 2400, 2700, 3000, 3300, 3600, 3900] },
                travel_speed: { base: 1000 },
                area_of_effect: { base: 200 },
                // Aghanim's Scepter twisters. Interpretation: twister_damage is damage per second, dealt in 0.25 s ticks.
                twister_distance_interval: { base: 300 },
                twister_radius: { base: 150 },
                twister_damage: { orb: "w", per_level: [50, 60, 70, 80, 90, 100, 110, 120, 130] },
                twister_duration: { orb: "q", per_level: [2.7, 2.9, 3.1, 3.3, 3.5, 3.7, 3.9, 4.1, 4.3] },
                twister_tick_rate: { base: 0.25 }
            } },
            emp: { cooldown: 27, cooldown_talent: 0, values: {
                mana_burned: { orb: "w", per_level: [100, 175, 250, 325, 400, 475, 550, 625, 700] },
                delay: { base: 2.9 },
                area_of_effect: { base: 675 },
                damage_per_mana_pct: { base: 60 },
                cast_range: { base: 950 }
            } },
            alacrity: { cooldown: 15, cooldown_talent: 0, values: {
                bonus_attack_speed: { orb: "w", per_level: [10, 22, 34, 46, 58, 70, 82, 94, 106], talent: 25 },
                bonus_damage: { orb: "e", per_level: [10, 22, 34, 46, 58, 70, 82, 94, 106], talent: 25 },
                duration: { base: 9 }
            } },
            chaos_meteor: { cooldown: 50, cooldown_talent: 0, values: {
                main_damage: { orb: "e", per_level: [55, 75, 95, 115, 135, 155, 175, 195, 215] },
                burn_dps: { orb: "e", per_level: [10, 15, 20, 25, 30, 35, 40, 45, 50] },
                meteor_count: { base: 1, talent: 2 },
                land_time: { base: 1.3 },
                area_of_effect: { base: 275 },
                travel_distance: { orb: "w", per_level: [465, 615, 780, 930, 1095, 1245, 1410, 1575, 1725] },
                travel_speed: { base: 300 },
                damage_interval: { base: 0.5 },
                burn_duration: { base: 3 },
                cast_range: { base: 700 },
                // Interpretation: angle between the talent's extra meteors, fanning out from the main one.
                spread_angle: { base: 20 }
            } },
            sun_strike: { cooldown: 23, cooldown_talent: 0, values: {
                damage: { orb: "e", per_level: [175, 225, 275, 325, 375, 425, 475, 525, 575] },
                delay: { base: 1.7 },
                area_of_effect: { base: 175 },
                cataclysm_count: { base: 2 },
                cataclysm_cooldown: { base: 90 },
                cataclysm_min_range: { base: 90 },
                cataclysm_max_range: { base: 180 },
                cataclysm_damage_pct: { base: 75 }
            } },
            forge_spirit: { cooldown: 27, cooldown_talent: 0, values: {
                spirit_damage: { orb: "e", per_level: [20, 30, 40, 50, 60, 70, 80, 90, 100] },
                spirit_attack_range: { orb: "q", per_level: [305, 360, 415, 470, 525, 580, 635, 690, 745] },
                spirit_duration: { orb: "q", per_level: [24, 30, 36, 42, 48, 54, 60, 66, 72] },
                // Spirit count = the lower of these two (tooltip: "determined by the lower level of Quas and Exort").
                spirit_count_quas: { orb: "q", per_level: [1, 1, 1, 2, 2, 2, 2, 3, 3] },
                spirit_count_exort: { orb: "e", per_level: [1, 1, 1, 2, 2, 2, 2, 3, 3] },
                armor_per_attack: { orb: "e", per_level: [0.8, 0.9, 1, 1.1, 1.2, 1.3, 1.4, 1.5, 1.6], talent_pct: 50 },
                attack_rate: { base: 1.35 }
            } },
            ice_wall: { cooldown: 23, cooldown_talent: 0, values: {
                damage_per_second: { orb: "e", per_level: [30, 36, 42, 48, 54, 60, 66, 72, 78], talent: 50 },
                duration: { orb: "q", per_level: [3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0, 11.0] },
                tick_interval: { base: 0.5 },
                wall_total_length: { base: 1200 },
                wall_width: { base: 105, scepter: 45 },
                wall_place_distance: { base: 200 },
                vector_cast_range: { base: 0, scepter: 600 },
                glacier_formation_delay: { base: 0, scepter: 1.3 },
                root_delay: { base: 0, scepter: 2.5 },
                root_duration: { base: 0, scepter: 2.5 },
                root_damage: { base: 0, scepter: 325 }
            } },
            deafening_blast: { cooldown: 36, cooldown_talent: 0, values: {
                damage: { orb: "e", per_level: [70, 110, 150, 190, 230, 270, 310, 350, 390] },
                travel_distance: { base: 1000 },
                travel_speed: { base: 1100 },
                radius_start: { base: 175 },
                radius_end: { base: 225 },
                knockback_duration: { orb: "q", per_level: [1.1, 1.2, 1.3, 1.4, 1.5, 1.6, 1.7, 1.8, 1.9] },
                disarm_duration: { orb: "w", per_level: [1.5, 2.0, 2.5, 3.0, 3.5, 4.0, 4.5, 5.0, 5.5] },
                radial_count: { base: 1, talent: 11 },
                // Interpretation: knockback push speed (not in Dota data).
                knockback_speed: { base: 100 }
            } }
        },
        // Slot order matches keys Z X C V CapsLock Space.
        item_layout: ["sheepstick", "shivas_guard", "refresher", "ultimate_scepter", "black_king_bar", "blink"],
        items: {
            sheepstick: { cooldown: 20, duration: 2.8, cast_range: 800 },
            shivas_guard: { cooldown: 27, damage: 225, radius: 825, speed: 400, slow_duration: 4 },
            refresher: { cooldown: 180 },
            ultimate_scepter: { cooldown: undefined },
            black_king_bar: { cooldown: 95, durations: [9, 8, 7] },
            blink: { cooldown: 15, range: 1200, range_clamp: 960 }
        },
        // Level 30 Invoker. Intelligence: 22 + 4/level, +1 per Exort level, +10 Aghanim's, +30 Hex.
        // Agility: 14 + 2/level, +1 per Wex level, +10 Aghanim's. Orb instances give 2x (talent) per-instance bonuses.
        hero: {
            level: 30, intelligence_base: 22, intelligence_gain: 4, agility_base: 14, agility_gain: 2,
            orb_attribute_bonus: 1, scepter_all_stats: 10, sheepstick_intelligence: 30, bkb_damage: 24,
            base_damage: 22, attack_rate: 1.7, attack_range: 600, base_attack_speed: 100, move_speed: 280,
            exort_damage_per_instance: [2, 4, 6, 8, 10, 12, 14, 16, 18],
            wex_attack_speed_per_instance: [1, 2, 3, 4, 5, 6, 7, 8, 9],
            instance_multiplier: 2
        },
        // Level 30 Axe with all talents and six Hearts of Tarrasque.
        // Tooltips: strength 22 HP and 0.1 regen; agility 0.16 armor; intelligence 12 mana and 0.1% magic resistance
        // (multiplied with the 25% base). Each Heart: +1% max HP regen; Behemoth's Blood 1.5% of missing HP (not stacking).
        axe: {
            level: 30, strength_base: 25, strength_gain: 2.7, talent_strength: 15,
            heart_strength: 40, hearts: 6, heart_regen_pct: 1, heart_missing_regen_pct: 1.5,
            base_hp: 120, hp_per_strength: 22, base_regen: 2, regen_per_strength: 0.1,
            agility_base: 18, agility_gain: 1.7, base_armor: 0, armor_per_agility: 0.16,
            intelligence_base: 18, intelligence_gain: 1.6, base_mana: 75, mana_per_intelligence: 12,
            base_magic_resistance: 0.25, magic_resistance_per_intelligence: 0.001, respawn_time: 3
        },
        // hull_radius is Dota's hero collision radius, added to every area/range check against the Axe.
        world: { hull_radius: 24, axe_start_distance: 700, double_tap_window: 0.3 }
    };
    return data;
}

function InvCaster(_quas = 9, _wex = 9, _exort = 9) constructor
{
    orb_levels = { q: _quas, w: _wex, e: _exort };
    orbs = [];
    slots = [undefined, undefined];
    cooldowns = {};
    items = array_create(6, undefined);
    array_copy(items, 0, inv_data().item_layout, 0, 6);
    bkb_uses = 0;
    bkb_duration = 0;
}

function inv_has_scepter(_c)
{
    for (var i = 0; i < array_length(_c.items); i++)
    {
        if (_c.items[i] == "ultimate_scepter")
        {
            return true;
        }
    }
    return false;
}

function inv_press_orb(_c, _orb)
{
    array_push(_c.orbs, _orb);
    if (array_length(_c.orbs) > 3)
    {
        array_delete(_c.orbs, 0, 1);
    }
}

function inv_orb_count(_c, _orb)
{
    var _n = 0;
    for (var i = 0; i < array_length(_c.orbs); i++)
    {
        if (_c.orbs[i] == _orb)
        {
            _n++;
        }
    }
    return _n;
}

function inv_combo_key(_orbs)
{
    if (array_length(_orbs) != 3)
    {
        return undefined;
    }
    var _sorted = [_orbs[0], _orbs[1], _orbs[2]];
    array_sort(_sorted, true);
    var _combos = inv_data().combos;
    var _key = _sorted[0] + _sorted[1] + _sorted[2];
    return variable_struct_exists(_combos, _key) ? variable_struct_get(_combos, _key) : undefined;
}

function inv_cooldown_left(_c, _key)
{
    return variable_struct_exists(_c.cooldowns, _key) ? variable_struct_get(_c.cooldowns, _key) : 0;
}

function inv_is_ready(_c, _key)
{
    return inv_cooldown_left(_c, _key) <= inv_data().epsilon;
}

function inv_start_cooldown(_c, _key, _seconds)
{
    variable_struct_set(_c.cooldowns, _key, _seconds);
}

function inv_tick(_c, _dt)
{
    var _keys = variable_struct_get_names(_c.cooldowns);
    for (var i = 0; i < array_length(_keys); i++)
    {
        variable_struct_set(_c.cooldowns, _keys[i], max(0, variable_struct_get(_c.cooldowns, _keys[i]) - _dt));
    }
}

function inv_invoke_cooldown(_c)
{
    var _d = inv_data().invoke;
    var _levels = _c.orb_levels.q + _c.orb_levels.w + _c.orb_levels.e;
    return max(0, _d.base_cooldown - _d.cooldown_per_orb_level * _levels);
}

function inv_invoke(_c)
{
    var _spell = inv_combo_key(_c.orbs);
    if (is_undefined(_spell) || !inv_is_ready(_c, "invoke"))
    {
        return undefined;
    }
    if (_c.slots[0] == _spell)
    {
        return _spell;
    }
    // Dota: Invoke costs no cooldown when it only swaps the two invoked spells.
    var _is_swap = (_c.slots[1] == _spell);
    _c.slots[1] = _c.slots[0];
    _c.slots[0] = _spell;
    if (_is_swap)
    {
        return _spell;
    }
    inv_start_cooldown(_c, "invoke", inv_invoke_cooldown(_c));
    return _spell;
}

function inv_spell_cooldown(_c, _spell)
{
    var _s = variable_struct_get(inv_data().spells, _spell);
    return _s.cooldown + _s.cooldown_talent;
}

// Value of a spell field at the caster's orb levels, with talents and Aghanim's Scepter applied.
function inv_spell_value(_c, _spell, _field)
{
    var _v = variable_struct_get(variable_struct_get(inv_data().spells, _spell).values, _field);
    var _result = variable_struct_exists(_v, "base") ? _v.base : 0;
    if (variable_struct_exists(_v, "orb"))
    {
        _result += _v.per_level[variable_struct_get(_c.orb_levels, _v.orb) - 1];
    }
    if (variable_struct_exists(_v, "talent"))
    {
        _result += _v.talent;
    }
    if (variable_struct_exists(_v, "scepter") && inv_has_scepter(_c))
    {
        _result += _v.scepter;
    }
    if (variable_struct_exists(_v, "talent_pct"))
    {
        _result *= 1 + _v.talent_pct / 100;
    }
    return _result;
}

function inv_cast_slot(_c, _index)
{
    var _spell = _c.slots[_index];
    if (is_undefined(_spell) || !inv_is_ready(_c, _spell))
    {
        return undefined;
    }
    inv_start_cooldown(_c, _spell, inv_spell_cooldown(_c, _spell));
    return _spell;
}

function inv_item_cooldown(_item)
{
    return variable_struct_get(inv_data().items, _item).cooldown;
}

function inv_use_item(_c, _index)
{
    var _item = _c.items[_index];
    var _cooldown = inv_item_cooldown(_item);
    if (is_undefined(_cooldown) || !inv_is_ready(_c, _item))
    {
        return undefined;
    }
    if (_item == "refresher")
    {
        inv_refresh(_c);
    }
    else if (_item == "black_king_bar")
    {
        var _durations = inv_data().items.black_king_bar.durations;
        _c.bkb_duration = _durations[min(_c.bkb_uses, array_length(_durations) - 1)];
        _c.bkb_uses++;
    }
    inv_start_cooldown(_c, _item, _cooldown);
    return _item;
}

// Refresher Orb resets ability cooldowns (spells and Invoke) only; items keep theirs.
function inv_refresh(_c)
{
    var _spells = inv_data().spells;
    var _keys = variable_struct_get_names(_c.cooldowns);
    for (var i = 0; i < array_length(_keys); i++)
    {
        if (_keys[i] == "invoke" || variable_struct_exists(_spells, _keys[i]))
        {
            variable_struct_set(_c.cooldowns, _keys[i], 0);
        }
    }
}

function inv_key_action(_key)
{
    switch (_key)
    {
        case 81: return "quas";   // Q
        case 87: return "wex";    // W
        case 69: return "exort";  // E
        case 70: return "slot1";  // F
        case 82: return "slot2";  // R
        case 68: return "invoke"; // D
        case 90: return "item0";  // Z
        case 88: return "item1";  // X
        case 67: return "item2";  // C
        case 86: return "item3";  // V
        case 20: return "item4";  // CapsLock
        case 32: return "item5";  // Space
    }
    return undefined;
}

function inv_hero_intelligence(_c)
{
    var _h = inv_data().hero;
    return _h.intelligence_base + _h.intelligence_gain * (_h.level - 1) + _h.orb_attribute_bonus * _c.orb_levels.e + _h.scepter_all_stats + _h.sheepstick_intelligence;
}

function inv_hero_agility(_c)
{
    var _h = inv_data().hero;
    return _h.agility_base + _h.agility_gain * (_h.level - 1) + _h.orb_attribute_bonus * _c.orb_levels.w + _h.scepter_all_stats;
}

function inv_hero_attack_damage(_c, _alacrity)
{
    var _h = inv_data().hero;
    var _damage = _h.base_damage + inv_hero_intelligence(_c) + _h.bkb_damage;
    _damage += inv_orb_count(_c, "e") * _h.exort_damage_per_instance[_c.orb_levels.e - 1] * _h.instance_multiplier;
    if (_alacrity)
    {
        _damage += inv_spell_value(_c, "alacrity", "bonus_damage");
    }
    return _damage;
}

function inv_hero_attack_interval(_c, _alacrity)
{
    var _h = inv_data().hero;
    var _speed = _h.base_attack_speed + inv_hero_agility(_c);
    _speed += inv_orb_count(_c, "w") * _h.wex_attack_speed_per_instance[_c.orb_levels.w - 1] * _h.instance_multiplier;
    if (_alacrity)
    {
        _speed += inv_spell_value(_c, "alacrity", "bonus_attack_speed");
    }
    return _h.attack_rate / (_speed / 100);
}

function inv_axe_strength()
{
    var _d = inv_data().axe;
    return _d.strength_base + _d.strength_gain * (_d.level - 1) + _d.talent_strength + _d.heart_strength * _d.hearts;
}

function InvAxe() constructor
{
    var _d = inv_data().axe;
    var _strength = inv_axe_strength();
    max_hp = _d.base_hp + _d.hp_per_strength * _strength;
    hp = max_hp;
    flat_regen = _d.base_regen + _d.regen_per_strength * _strength + _d.hearts * _d.heart_regen_pct / 100 * max_hp;
    missing_regen_pct = (_d.hearts > 0) ? _d.heart_missing_regen_pct : 0;
    var _intelligence = _d.intelligence_base + _d.intelligence_gain * (_d.level - 1);
    max_mana = _d.base_mana + _d.mana_per_intelligence * _intelligence;
    mana = max_mana;
    magic_resistance = 1 - (1 - _d.base_magic_resistance) * (1 - _d.magic_resistance_per_intelligence * _intelligence);
    armor = _d.base_armor + _d.armor_per_agility * (_d.agility_base + _d.agility_gain * (_d.level - 1));
    alive = true;
    respawn_left = 0;
    x = 0;
    y = 0;
    inv_axe_clear_statuses(self);
}

function inv_axe_clear_statuses(_a)
{
    _a.lift_left = 0;
    _a.lift_damage = 0;
    _a.cold_snap_left = 0;
    _a.cold_snap_freeze_cd = 0;
    _a.frozen_left = 0;
    _a.hexed_left = 0;
    _a.disarmed_left = 0;
    _a.knockback_left = 0;
    _a.knockback_dir = 0;
    _a.slowed_left = 0;
    _a.rooted_left = 0;
    _a.burn_left = 0;
    _a.burn_timer = 0;
    _a.armor_reduction = 0;
}

function inv_damage_after_resistance(_amount, _type, _a)
{
    if (_type == "magical")
    {
        return _amount * (1 - _a.magic_resistance);
    }
    if (_type == "physical")
    {
        var _armor = _a.armor - _a.armor_reduction;
        return _amount * (1 - 0.06 * _armor / (1 + 0.06 * abs(_armor)));
    }
    return _amount;
}

function inv_axe_hit(_a, _amount, _type)
{
    if (!_a.alive)
    {
        return 0;
    }
    var _dealt = inv_damage_after_resistance(_amount, _type, _a);
    _a.hp -= _dealt;
    if (_a.hp <= 0)
    {
        _a.hp = 0;
        _a.alive = false;
        _a.respawn_left = inv_data().axe.respawn_time;
    }
    return _dealt;
}

function inv_axe_tick(_a, _dt)
{
    if (!_a.alive)
    {
        _a.respawn_left -= _dt;
        if (_a.respawn_left <= inv_data().epsilon)
        {
            inv_axe_reset(_a);
        }
        return;
    }
    var _regen = _a.flat_regen + _a.missing_regen_pct / 100 * (_a.max_hp - _a.hp);
    _a.hp = min(_a.max_hp, _a.hp + _regen * _dt);
}

function inv_axe_reset(_a)
{
    _a.hp = _a.max_hp;
    _a.mana = _a.max_mana;
    _a.alive = true;
    _a.respawn_left = 0;
    inv_axe_clear_statuses(_a);
}
