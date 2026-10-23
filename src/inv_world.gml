// Invoker Arena simulation: hero, Axe, spell/item effects and damage events. Positions in Dota units, times in seconds.
// Each tick: cooldowns, hero (move/attack/buffs), Axe statuses (landing, burn, knockback, regen), then effects.

function InvWorld() constructor
{
    caster = new InvCaster();
    hero = {
        x: 0, y: 0, facing: 0, moving: false, move_x: 0, move_y: 0, attacking: false, attack_cd: 0,
        invisible_left: 0, alacrity_left: 0, bkb_left: 0
    };
    axe = new InvAxe();
    axe.x = inv_data().world.axe_start_distance;
    effects = [];
    events = [];
    time = 0;
    // Latest regular Sun Strike ({ time, effect }); a second tap within the window turns it into Cataclysm.
    last_sun_strike = undefined;
}

function inv_point_segment_distance(_px, _py, _x1, _y1, _x2, _y2)
{
    var _dx = _x2 - _x1;
    var _dy = _y2 - _y1;
    var _len2 = _dx * _dx + _dy * _dy;
    if (_len2 <= 0)
    {
        return point_distance(_px, _py, _x1, _y1);
    }
    var _t = clamp(((_px - _x1) * _dx + (_py - _y1) * _dy) / _len2, 0, 1);
    return point_distance(_px, _py, _x1 + _t * _dx, _y1 + _t * _dy);
}

function inv_world_axe_in_radius(_w, _x, _y, _radius)
{
    return point_distance(_x, _y, _w.axe.x, _w.axe.y) <= _radius + inv_data().world.hull_radius;
}

function inv_world_axe_targetable(_w)
{
    return _w.axe.alive && _w.axe.lift_left <= 0;
}

function inv_world_clamp_point(_w, _x, _y, _range)
{
    if (point_distance(_w.hero.x, _w.hero.y, _x, _y) <= _range)
    {
        return { x: _x, y: _y };
    }
    var _dir = point_direction(_w.hero.x, _w.hero.y, _x, _y);
    return { x: _w.hero.x + lengthdir_x(_range, _dir), y: _w.hero.y + lengthdir_y(_range, _dir) };
}

function inv_world_effects_of(_w, _kind)
{
    var _found = [];
    for (var i = 0; i < array_length(_w.effects); i++)
    {
        if (_w.effects[i].kind == _kind)
        {
            array_push(_found, _w.effects[i]);
        }
    }
    return _found;
}

function inv_world_remove_effect(_w, _effect)
{
    for (var i = array_length(_w.effects) - 1; i >= 0; i--)
    {
        if (_w.effects[i] == _effect)
        {
            array_delete(_w.effects, i, 1);
        }
    }
}

// Applies damage to the Axe and records a damage event; a lifted (Tornado) or dead Axe takes nothing.
function inv_world_damage(_w, _amount, _type, _source)
{
    var _a = _w.axe;
    if (!inv_world_axe_targetable(_w))
    {
        return 0;
    }
    var _dealt = inv_axe_hit(_a, _amount, _type);
    array_push(_w.events, { kind: "damage", source: _source, amount: _dealt, type: _type });
    var _c = _w.caster;
    if (_dealt > inv_spell_value(_c, "cold_snap", "damage_trigger") && _a.cold_snap_left > 0 && _a.cold_snap_freeze_cd <= inv_data().epsilon)
    {
        inv_world_cold_snap_freeze(_w);
    }
    return _dealt;
}

function inv_world_cold_snap_freeze(_w)
{
    var _c = _w.caster;
    var _a = _w.axe;
    // The freeze cooldown is set first so the freeze damage itself cannot retrigger it.
    _a.cold_snap_freeze_cd = inv_spell_value(_c, "cold_snap", "freeze_cooldown");
    _a.frozen_left = inv_spell_value(_c, "cold_snap", "freeze_duration");
    inv_world_damage(_w, inv_spell_value(_c, "cold_snap", "freeze_damage"), "magical", "cold_snap");
}

function inv_world_break_invisibility(_w)
{
    _w.hero.invisible_left = 0;
}

function inv_world_order_move(_w, _x, _y)
{
    var _h = _w.hero;
    _h.moving = true;
    _h.attacking = false;
    _h.move_x = _x;
    _h.move_y = _y;
}

function inv_world_order_attack(_w)
{
    _w.hero.attacking = true;
    _w.hero.moving = false;
}

function inv_world_can_target(_w, _spell)
{
    if (_spell != "cold_snap")
    {
        return true;
    }
    return inv_world_axe_targetable(_w) && inv_world_axe_in_radius(_w, _w.hero.x, _w.hero.y, inv_spell_value(_w.caster, "cold_snap", "cast_range"));
}

// Casts the spell in slot 0 (key F) or 1 (key R) at the given point. Returns the spell key, "cataclysm" or undefined.
function inv_world_cast_slot(_w, _index, _tx, _ty)
{
    var _c = _w.caster;
    var _spell = _c.slots[_index];
    if (is_undefined(_spell))
    {
        return undefined;
    }
    if (_spell == "sun_strike" && inv_world_try_cataclysm(_w))
    {
        return "cataclysm";
    }
    if (!inv_is_ready(_c, _spell) || !inv_world_can_target(_w, _spell))
    {
        return undefined;
    }
    inv_cast_slot(_c, _index);
    inv_world_break_invisibility(_w);
    if (point_distance(_w.hero.x, _w.hero.y, _tx, _ty) > 0)
    {
        _w.hero.facing = point_direction(_w.hero.x, _w.hero.y, _tx, _ty);
    }
    inv_world_spawn_spell(_w, _spell, _tx, _ty);
    return _spell;
}

function inv_world_spawn_spell(_w, _spell, _tx, _ty)
{
    var _c = _w.caster;
    var _h = _w.hero;
    switch (_spell)
    {
        case "sun_strike":
            var _strike = inv_world_spawn_strike(_w, _tx, _ty, inv_spell_value(_c, "sun_strike", "damage"), "sun_strike");
            _w.last_sun_strike = { time: _w.time, effect: _strike };
            break;
        case "emp":
            var _p = inv_world_clamp_point(_w, _tx, _ty, inv_spell_value(_c, "emp", "cast_range"));
            array_push(_w.effects, { kind: "emp", x: _p.x, y: _p.y, delay: inv_spell_value(_c, "emp", "delay") });
            break;
        case "tornado":
            array_push(_w.effects, {
                kind: "tornado", x: _h.x, y: _h.y, dir: _h.facing,
                travelled: 0, next_twister: inv_spell_value(_c, "tornado", "twister_distance_interval"), hit: false
            });
            break;
        case "cold_snap":
            _w.axe.cold_snap_left = inv_spell_value(_c, "cold_snap", "duration");
            inv_world_cold_snap_freeze(_w);
            break;
        case "chaos_meteor":
            var _land = inv_world_clamp_point(_w, _tx, _ty, inv_spell_value(_c, "chaos_meteor", "cast_range"));
            var _count = inv_spell_value(_c, "chaos_meteor", "meteor_count");
            var _spread = inv_spell_value(_c, "chaos_meteor", "spread_angle");
            for (var i = 0; i < _count; i++)
            {
                array_push(_w.effects, {
                    kind: "meteor", x: _land.x, y: _land.y, dir: _h.facing + (i - (_count - 1) / 2) * _spread,
                    land_left: inv_spell_value(_c, "chaos_meteor", "land_time"), landed: false, travelled: 0, tick_timer: 0
                });
            }
            break;
        case "deafening_blast":
            var _group = { hit: false };
            var _waves = inv_spell_value(_c, "deafening_blast", "radial_count");
            for (var j = 0; j < _waves; j++)
            {
                array_push(_w.effects, { kind: "blast", x: _h.x, y: _h.y, dir: _h.facing + j * 360 / _waves, travelled: 0, group: _group });
            }
            break;
        case "ice_wall":
            var _range = inv_spell_value(_c, "ice_wall", "vector_cast_range");
            var _center = (_range > 0)
                ? inv_world_clamp_point(_w, _tx, _ty, _range)
                : { x: _h.x + lengthdir_x(inv_spell_value(_c, "ice_wall", "wall_place_distance"), _h.facing), y: _h.y + lengthdir_y(inv_spell_value(_c, "ice_wall", "wall_place_distance"), _h.facing) };
            array_push(_w.effects, {
                kind: "ice_wall", x: _center.x, y: _center.y, dir: _h.facing + 90,
                form_left: inv_spell_value(_c, "ice_wall", "glacier_formation_delay"),
                life: inv_spell_value(_c, "ice_wall", "duration"), tick_timer: 0, inside_time: 0, rooted: false
            });
            break;
        case "forge_spirit":
            var _old = inv_world_effects_of(_w, "spirit");
            for (var k = 0; k < array_length(_old); k++)
            {
                inv_world_remove_effect(_w, _old[k]);
            }
            var _spirits = min(inv_spell_value(_c, "forge_spirit", "spirit_count_quas"), inv_spell_value(_c, "forge_spirit", "spirit_count_exort"));
            for (var m = 0; m < _spirits; m++)
            {
                array_push(_w.effects, {
                    kind: "spirit", x: _h.x + lengthdir_x(50, m * 360 / _spirits), y: _h.y + lengthdir_y(50, m * 360 / _spirits),
                    life: inv_spell_value(_c, "forge_spirit", "spirit_duration"), attack_cd: inv_spell_value(_c, "forge_spirit", "attack_rate")
                });
            }
            break;
        case "alacrity":
            _h.alacrity_left = inv_spell_value(_c, "alacrity", "duration");
            break;
        case "ghost_walk":
            _h.invisible_left = inv_spell_value(_c, "ghost_walk", "duration");
            break;
    }
}

function inv_world_spawn_strike(_w, _x, _y, _damage, _source)
{
    var _e = { kind: "sun_strike", x: _x, y: _y, delay: inv_spell_value(_w.caster, "sun_strike", "delay"), damage: _damage, source: _source };
    array_push(_w.effects, _e);
    return _e;
}

function inv_world_try_cataclysm(_w)
{
    var _c = _w.caster;
    var _last = _w.last_sun_strike;
    if (!inv_has_scepter(_c) || is_undefined(_last) || _w.time - _last.time > inv_data().world.double_tap_window)
    {
        return false;
    }
    inv_world_remove_effect(_w, _last.effect);
    _w.last_sun_strike = undefined;
    var _damage = inv_spell_value(_c, "sun_strike", "damage") * inv_spell_value(_c, "sun_strike", "cataclysm_damage_pct") / 100;
    var _min_range = inv_spell_value(_c, "sun_strike", "cataclysm_min_range");
    var _max_range = inv_spell_value(_c, "sun_strike", "cataclysm_max_range");
    for (var i = 0; i < inv_spell_value(_c, "sun_strike", "cataclysm_count"); i++)
    {
        var _r = random_range(_min_range, _max_range);
        var _angle = random(360);
        inv_world_spawn_strike(_w, _w.axe.x + lengthdir_x(_r, _angle), _w.axe.y + lengthdir_y(_r, _angle), _damage, "cataclysm");
    }
    inv_start_cooldown(_c, "sun_strike", inv_spell_value(_c, "sun_strike", "cataclysm_cooldown"));
    return true;
}

function inv_world_spawn_twister(_w, _x, _y)
{
    array_push(_w.effects, { kind: "twister", x: _x, y: _y, life: inv_spell_value(_w.caster, "tornado", "twister_duration"), tick_timer: 0 });
}

// Uses the item in slot 0..5 (keys Z X C V CapsLock Space). Returns the item key or undefined.
function inv_world_use_item(_w, _index, _tx, _ty)
{
    var _c = _w.caster;
    var _h = _w.hero;
    var _a = _w.axe;
    var _item = _c.items[_index];
    var _items = inv_data().items;
    if (_item == "sheepstick" && !(inv_world_axe_targetable(_w) && inv_world_axe_in_radius(_w, _h.x, _h.y, _items.sheepstick.cast_range)))
    {
        return undefined;
    }
    if (is_undefined(inv_use_item(_c, _index)))
    {
        return undefined;
    }
    inv_world_break_invisibility(_w);
    switch (_item)
    {
        case "sheepstick":
            _a.hexed_left = _items.sheepstick.duration;
            break;
        case "shivas_guard":
            array_push(_w.effects, { kind: "shiva", x: _h.x, y: _h.y, radius: 0, hit: false });
            break;
        case "black_king_bar":
            _h.bkb_left = _c.bkb_duration;
            break;
        case "blink":
            var _d = point_distance(_h.x, _h.y, _tx, _ty);
            var _dist = (_d <= _items.blink.range) ? _d : _items.blink.range_clamp;
            var _dir = point_direction(_h.x, _h.y, _tx, _ty);
            _h.x += lengthdir_x(_dist, _dir);
            _h.y += lengthdir_y(_dist, _dir);
            _h.moving = false;
            break;
    }
    return _item;
}

function inv_world_tick(_w, _dt)
{
    _w.time += _dt;
    inv_tick(_w.caster, _dt);
    inv_world_tick_hero(_w, _dt);
    inv_world_tick_axe(_w, _dt);
    // Iterate a snapshot: effects may spawn (twisters) or remove (Cataclysm, Forge Spirit) others while ticking.
    var _snapshot = [];
    array_copy(_snapshot, 0, _w.effects, 0, array_length(_w.effects));
    for (var i = 0; i < array_length(_snapshot); i++)
    {
        if (inv_world_tick_effect(_w, _snapshot[i], _dt))
        {
            inv_world_remove_effect(_w, _snapshot[i]);
        }
    }
}

function inv_world_tick_hero(_w, _dt)
{
    var _h = _w.hero;
    var _a = _w.axe;
    var _eps = inv_data().epsilon;
    var _hd = inv_data().hero;
    _h.invisible_left = max(0, _h.invisible_left - _dt);
    _h.alacrity_left = max(0, _h.alacrity_left - _dt);
    _h.bkb_left = max(0, _h.bkb_left - _dt);
    _h.attack_cd = max(0, _h.attack_cd - _dt);
    if (_h.attacking)
    {
        if (!_a.alive)
        {
            _h.attacking = false;
            return;
        }
        var _range = _hd.attack_range + inv_data().world.hull_radius;
        var _d = point_distance(_h.x, _h.y, _a.x, _a.y);
        _h.facing = point_direction(_h.x, _h.y, _a.x, _a.y);
        if (_d > _range)
        {
            var _step = min(_hd.move_speed * _dt, _d - _range);
            _h.x += lengthdir_x(_step, _h.facing);
            _h.y += lengthdir_y(_step, _h.facing);
            _d -= _step;
        }
        if (_d <= _range + _eps && _h.attack_cd <= _eps && _a.lift_left <= 0)
        {
            var _alacrity = _h.alacrity_left > 0;
            inv_world_damage(_w, inv_hero_attack_damage(_w.caster, _alacrity), "physical", "attack");
            _h.attack_cd = inv_hero_attack_interval(_w.caster, _alacrity);
        }
        return;
    }
    if (_h.moving)
    {
        var _left = point_distance(_h.x, _h.y, _h.move_x, _h.move_y);
        var _move = min(_hd.move_speed * _dt, _left);
        if (_left > 0)
        {
            _h.facing = point_direction(_h.x, _h.y, _h.move_x, _h.move_y);
            _h.x += lengthdir_x(_move, _h.facing);
            _h.y += lengthdir_y(_move, _h.facing);
        }
        _h.moving = (_left - _move) > _eps;
    }
}

function inv_world_tick_axe(_w, _dt)
{
    var _a = _w.axe;
    var _c = _w.caster;
    var _eps = inv_data().epsilon;
    _a.cold_snap_left = max(0, _a.cold_snap_left - _dt);
    _a.cold_snap_freeze_cd = max(0, _a.cold_snap_freeze_cd - _dt);
    _a.frozen_left = max(0, _a.frozen_left - _dt);
    _a.hexed_left = max(0, _a.hexed_left - _dt);
    _a.disarmed_left = max(0, _a.disarmed_left - _dt);
    _a.slowed_left = max(0, _a.slowed_left - _dt);
    _a.rooted_left = max(0, _a.rooted_left - _dt);
    if (_a.knockback_left > 0)
    {
        var _push = inv_spell_value(_c, "deafening_blast", "knockback_speed") * min(_dt, _a.knockback_left);
        _a.x += lengthdir_x(_push, _a.knockback_dir);
        _a.y += lengthdir_y(_push, _a.knockback_dir);
        _a.knockback_left = max(0, _a.knockback_left - _dt);
    }
    if (_a.lift_left > 0)
    {
        _a.lift_left -= _dt;
        if (_a.lift_left <= _eps)
        {
            _a.lift_left = 0;
            inv_world_damage(_w, _a.lift_damage, "magical", "tornado");
        }
    }
    if (_a.burn_left > 0)
    {
        var _interval = inv_spell_value(_c, "chaos_meteor", "damage_interval");
        _a.burn_timer += min(_dt, _a.burn_left);
        _a.burn_left = max(0, _a.burn_left - _dt);
        while (_a.burn_timer >= _interval - _eps)
        {
            _a.burn_timer -= _interval;
            inv_world_damage(_w, inv_spell_value(_c, "chaos_meteor", "burn_dps") * _interval, "magical", "chaos_meteor_burn");
        }
    }
    inv_axe_tick(_a, _dt);
}

// Returns true when the effect is finished and should be removed.
function inv_world_tick_effect(_w, _e, _dt)
{
    var _c = _w.caster;
    var _eps = inv_data().epsilon;
    switch (_e.kind)
    {
        case "sun_strike":
            _e.delay -= _dt;
            if (_e.delay > _eps)
            {
                return false;
            }
            if (inv_world_axe_in_radius(_w, _e.x, _e.y, inv_spell_value(_c, "sun_strike", "area_of_effect")))
            {
                inv_world_damage(_w, _e.damage, "pure", _e.source);
            }
            return true;
        case "emp":
            _e.delay -= _dt;
            if (_e.delay > _eps)
            {
                return false;
            }
            var _a = _w.axe;
            if (inv_world_axe_targetable(_w) && inv_world_axe_in_radius(_w, _e.x, _e.y, inv_spell_value(_c, "emp", "area_of_effect")))
            {
                var _burn = min(inv_spell_value(_c, "emp", "mana_burned"), _a.mana);
                _a.mana -= _burn;
                inv_world_damage(_w, _burn * inv_spell_value(_c, "emp", "damage_per_mana_pct") / 100, "magical", "emp");
            }
            return true;
        case "tornado":
            return inv_world_tick_tornado(_w, _e, _dt);
        case "twister":
            return inv_world_tick_twister(_w, _e, _dt);
        case "meteor":
            return inv_world_tick_meteor(_w, _e, _dt);
        case "blast":
            return inv_world_tick_blast(_w, _e, _dt);
        case "ice_wall":
            return inv_world_tick_ice_wall(_w, _e, _dt);
        case "spirit":
            return inv_world_tick_spirit(_w, _e, _dt);
        case "shiva":
            return inv_world_tick_shiva(_w, _e, _dt);
    }
    return true;
}

function inv_world_tick_tornado(_w, _e, _dt)
{
    var _c = _w.caster;
    var _eps = inv_data().epsilon;
    var _max = inv_spell_value(_c, "tornado", "travel_distance");
    var _step = min(inv_spell_value(_c, "tornado", "travel_speed") * _dt, _max - _e.travelled);
    var _x1 = _e.x;
    var _y1 = _e.y;
    _e.x += lengthdir_x(_step, _e.dir);
    _e.y += lengthdir_y(_step, _e.dir);
    _e.travelled += _step;
    if (inv_has_scepter(_c))
    {
        var _interval = inv_spell_value(_c, "tornado", "twister_distance_interval");
        while (_e.next_twister <= _e.travelled + _eps)
        {
            var _back = _e.travelled - _e.next_twister;
            inv_world_spawn_twister(_w, _e.x - lengthdir_x(_back, _e.dir), _e.y - lengthdir_y(_back, _e.dir));
            _e.next_twister += _interval;
        }
    }
    var _a = _w.axe;
    var _reach = inv_spell_value(_c, "tornado", "area_of_effect") + inv_data().world.hull_radius;
    if (!_e.hit && inv_world_axe_targetable(_w) && inv_point_segment_distance(_a.x, _a.y, _x1, _y1, _e.x, _e.y) <= _reach)
    {
        _e.hit = true;
        _a.lift_left = inv_spell_value(_c, "tornado", "lift_duration");
        _a.lift_damage = inv_spell_value(_c, "tornado", "damage");
    }
    return _e.travelled >= _max - _eps;
}

function inv_world_tick_twister(_w, _e, _dt)
{
    var _c = _w.caster;
    var _eps = inv_data().epsilon;
    var _rate = inv_spell_value(_c, "tornado", "twister_tick_rate");
    _e.tick_timer += min(_dt, _e.life);
    while (_e.tick_timer >= _rate - _eps)
    {
        _e.tick_timer -= _rate;
        if (inv_world_axe_in_radius(_w, _e.x, _e.y, inv_spell_value(_c, "tornado", "twister_radius")))
        {
            inv_world_damage(_w, inv_spell_value(_c, "tornado", "twister_damage") * _rate, "magical", "twister");
        }
    }
    _e.life -= _dt;
    return _e.life <= _eps;
}

function inv_world_tick_meteor(_w, _e, _dt)
{
    var _c = _w.caster;
    var _eps = inv_data().epsilon;
    var _interval = inv_spell_value(_c, "chaos_meteor", "damage_interval");
    if (!_e.landed)
    {
        _e.land_left -= _dt;
        if (_e.land_left > _eps)
        {
            return false;
        }
        // Landing deals damage at once; the rest of the frame is spent rolling.
        _e.landed = true;
        _e.tick_timer = _interval;
        _dt = max(0, -_e.land_left);
    }
    var _max = inv_spell_value(_c, "chaos_meteor", "travel_distance");
    var _step = min(inv_spell_value(_c, "chaos_meteor", "travel_speed") * _dt, _max - _e.travelled);
    _e.x += lengthdir_x(_step, _e.dir);
    _e.y += lengthdir_y(_step, _e.dir);
    _e.travelled += _step;
    _e.tick_timer += _dt;
    while (_e.tick_timer >= _interval - _eps)
    {
        _e.tick_timer -= _interval;
        if (inv_world_axe_targetable(_w) && inv_world_axe_in_radius(_w, _e.x, _e.y, inv_spell_value(_c, "chaos_meteor", "area_of_effect")))
        {
            inv_world_damage(_w, inv_spell_value(_c, "chaos_meteor", "main_damage"), "magical", "chaos_meteor");
            _w.axe.burn_left = inv_spell_value(_c, "chaos_meteor", "burn_duration");
        }
    }
    return _e.travelled >= _max - _eps;
}

function inv_world_tick_blast(_w, _e, _dt)
{
    var _c = _w.caster;
    var _a = _w.axe;
    var _max = inv_spell_value(_c, "deafening_blast", "travel_distance");
    var _step = min(inv_spell_value(_c, "deafening_blast", "travel_speed") * _dt, _max - _e.travelled);
    var _x1 = _e.x;
    var _y1 = _e.y;
    _e.x += lengthdir_x(_step, _e.dir);
    _e.y += lengthdir_y(_step, _e.dir);
    _e.travelled += _step;
    var _r0 = inv_spell_value(_c, "deafening_blast", "radius_start");
    var _radius = _r0 + (inv_spell_value(_c, "deafening_blast", "radius_end") - _r0) * _e.travelled / _max;
    if (!_e.group.hit && inv_world_axe_targetable(_w) && inv_point_segment_distance(_a.x, _a.y, _x1, _y1, _e.x, _e.y) <= _radius + inv_data().world.hull_radius)
    {
        _e.group.hit = true;
        inv_world_damage(_w, inv_spell_value(_c, "deafening_blast", "damage"), "magical", "deafening_blast");
        _a.knockback_left = inv_spell_value(_c, "deafening_blast", "knockback_duration");
        _a.knockback_dir = _e.dir;
        _a.disarmed_left = inv_spell_value(_c, "deafening_blast", "disarm_duration");
    }
    return _e.travelled >= _max - inv_data().epsilon;
}

function inv_world_tick_ice_wall(_w, _e, _dt)
{
    var _c = _w.caster;
    var _a = _w.axe;
    var _eps = inv_data().epsilon;
    if (_e.form_left > _eps)
    {
        _e.form_left -= _dt;
        if (_e.form_left > _eps)
        {
            return false;
        }
        _dt = max(0, -_e.form_left);
        _e.form_left = 0;
    }
    var _half = inv_spell_value(_c, "ice_wall", "wall_total_length") / 2;
    var _x1 = _e.x - lengthdir_x(_half, _e.dir);
    var _y1 = _e.y - lengthdir_y(_half, _e.dir);
    var _x2 = _e.x + lengthdir_x(_half, _e.dir);
    var _y2 = _e.y + lengthdir_y(_half, _e.dir);
    var _reach = inv_spell_value(_c, "ice_wall", "wall_width") / 2 + inv_data().world.hull_radius;
    if (inv_world_axe_targetable(_w) && inv_point_segment_distance(_a.x, _a.y, _x1, _y1, _x2, _y2) <= _reach)
    {
        var _interval = inv_spell_value(_c, "ice_wall", "tick_interval");
        _e.inside_time += _dt;
        _e.tick_timer += _dt;
        _a.slowed_left = max(_a.slowed_left, 2);
        while (_e.tick_timer >= _interval - _eps)
        {
            _e.tick_timer -= _interval;
            inv_world_damage(_w, inv_spell_value(_c, "ice_wall", "damage_per_second") * _interval, "magical", "ice_wall");
        }
        var _root_delay = inv_spell_value(_c, "ice_wall", "root_delay");
        if (!_e.rooted && _root_delay > 0 && _e.inside_time >= _root_delay - _eps)
        {
            _e.rooted = true;
            _a.rooted_left = inv_spell_value(_c, "ice_wall", "root_duration");
            inv_world_damage(_w, inv_spell_value(_c, "ice_wall", "root_damage"), "magical", "ice_wall_root");
        }
    }
    _e.life -= _dt;
    return _e.life <= _eps;
}

function inv_world_tick_spirit(_w, _e, _dt)
{
    var _c = _w.caster;
    var _a = _w.axe;
    var _eps = inv_data().epsilon;
    _e.life -= _dt;
    _e.attack_cd = max(0, _e.attack_cd - _dt);
    var _range = inv_spell_value(_c, "forge_spirit", "spirit_attack_range") + inv_data().world.hull_radius;
    var _d = point_distance(_e.x, _e.y, _a.x, _a.y);
    if (_d > _range)
    {
        // Interpretation: spirits walk toward the Axe at hero speed.
        var _step = min(inv_data().hero.move_speed * _dt, _d - _range);
        var _dir = point_direction(_e.x, _e.y, _a.x, _a.y);
        _e.x += lengthdir_x(_step, _dir);
        _e.y += lengthdir_y(_step, _dir);
        _d -= _step;
    }
    if (_d <= _range + _eps && _e.attack_cd <= _eps && inv_world_axe_targetable(_w))
    {
        inv_world_damage(_w, inv_spell_value(_c, "forge_spirit", "spirit_damage"), "physical", "forge_spirit");
        _a.armor_reduction += inv_spell_value(_c, "forge_spirit", "armor_per_attack");
        _e.attack_cd = inv_spell_value(_c, "forge_spirit", "attack_rate");
    }
    return _e.life <= _eps;
}

function inv_world_tick_shiva(_w, _e, _dt)
{
    var _a = _w.axe;
    var _s = inv_data().items.shivas_guard;
    // Tooltip: the wave follows its caster.
    _e.x = _w.hero.x;
    _e.y = _w.hero.y;
    _e.radius = min(_s.radius, _e.radius + _s.speed * _dt);
    if (!_e.hit && inv_world_axe_targetable(_w) && inv_world_axe_in_radius(_w, _e.x, _e.y, _e.radius))
    {
        _e.hit = true;
        inv_world_damage(_w, _s.damage, "magical", "shivas_guard");
        _a.slowed_left = _s.slow_duration;
    }
    return _e.radius >= _s.radius - inv_data().epsilon;
}
