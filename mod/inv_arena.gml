// Invoker Arena mode inside Leaf Blower Revolution: I toggles it; it owns input, the world simulation and drawing.
// World positions are Dota units, drawn in GUI space around a fixed origin.

function inv_arena_active()
{
    return instance_exists(o_invoker_arena);
}

function inv_arena_autotest_enabled()
{
    for (var i = 0; i <= parameter_count(); i++)
    {
        if (parameter_string(i) == "-inv_autotest")
        {
            return true;
        }
    }
    return false;
}

// Prepended to o_game Step: I toggles the arena during normal play (no menu open, no key rebinding).
function inv_arena_check_toggle()
{
    var _auto = !inv_arena_active() && !variable_global_exists("inv_autotest_started") && inv_arena_autotest_enabled();
    if (!keyboard_check_pressed(73) && !_auto)
    {
        return;
    }
    if (inv_arena_active())
    {
        instance_destroy(o_invoker_arena);
        return;
    }
    if (!_auto && (o_game.state != 0 || global.is_awaiting_input))
    {
        return;
    }
    if (_auto)
    {
        global.inv_autotest_started = true;
    }
    instance_create_depth(0, 0, -15000, o_invoker_arena);
}

// Prepended to the title screen (o_init Draw GUI): with -inv_autotest, presses "Start new game" by itself.
function inv_arena_autotest_title()
{
    if (!inv_arena_autotest_enabled() || variable_global_exists("inv_autotest_newgame"))
    {
        return;
    }
    global.inv_autotest_newgame = true;
    global.android_new_save_slot = true;
    inv_arena_mark("title");
    room_goto(r_start);
}

function inv_arena_mark(_state)
{
    if (!inv_arena_autotest_enabled())
    {
        return;
    }
    var _f = file_text_open_write("lbr_mod_e2e_state.txt");
    file_text_write_string(_f, _state);
    file_text_close(_f);
}

function inv_arena_create(_a)
{
    _a.world = new InvWorld();
    _a.floaters = [];
    _a.combo_damage = 0;
    _a.combo_idle = 0;
    _a.prev_draw_hud = global.draw_hud;
    global.draw_hud = false;
    _a.autotest = inv_arena_autotest_enabled();
    _a.auto_step = 0;
    _a.auto_time = 0;
    _a.voice_cd = 0;
    inv_arena_assets();
    inv_arena_mark("entered");
}

function inv_arena_cleanup(_a)
{
    global.draw_hud = _a.prev_draw_hud;
}

function inv_arena_reset(_a)
{
    _a.world = new InvWorld();
    _a.floaters = [];
    _a.combo_damage = 0;
    _a.combo_idle = 0;
}

function inv_arena_scale()
{
    return display_get_gui_height() / 1700;
}

function inv_arena_gx(_x)
{
    return display_get_gui_width() * 0.32 + _x * inv_arena_scale();
}

function inv_arena_gy(_y)
{
    return display_get_gui_height() * 0.45 + _y * inv_arena_scale();
}

function inv_arena_mouse_wx()
{
    return (device_mouse_x_to_gui(0) - display_get_gui_width() * 0.32) / inv_arena_scale();
}

function inv_arena_mouse_wy()
{
    return (device_mouse_y_to_gui(0) - display_get_gui_height() * 0.45) / inv_arena_scale();
}

function inv_arena_label(_key)
{
    switch (_key)
    {
        case "cold_snap": return "Cold Snap";
        case "ghost_walk": return "Ghost Walk";
        case "ice_wall": return "Ice Wall";
        case "emp": return "E.M.P.";
        case "tornado": return "Tornado";
        case "alacrity": return "Alacrity";
        case "sun_strike": return "Sun Strike";
        case "forge_spirit": return "Forge Spirit";
        case "chaos_meteor": return "Chaos Meteor";
        case "deafening_blast": return "Deafening Blast";
        case "cataclysm": return "Cataclysm";
        case "sheepstick": return "Hex";
        case "shivas_guard": return "Shiva's Guard";
        case "refresher": return "Refresher Orb";
        case "ultimate_scepter": return "Aghanim's";
        case "black_king_bar": return "BKB";
        case "blink": return "Blink";
    }
    return string(_key);
}

function inv_arena_spell_color(_key)
{
    switch (_key)
    {
        case "cold_snap": case "ice_wall": return make_color_rgb(110, 200, 255);
        case "ghost_walk": return make_color_rgb(150, 160, 255);
        case "emp": case "tornado": return make_color_rgb(200, 120, 255);
        case "alacrity": return make_color_rgb(255, 170, 80);
        case "sun_strike": return make_color_rgb(255, 220, 90);
        case "forge_spirit": case "chaos_meteor": return make_color_rgb(255, 120, 50);
        case "deafening_blast": return make_color_rgb(180, 255, 220);
    }
    return c_white;
}

function inv_arena_orb_color(_orb)
{
    switch (_orb)
    {
        case "q": return make_color_rgb(90, 190, 255);
        case "w": return make_color_rgb(205, 110, 255);
        case "e": return make_color_rgb(255, 150, 50);
    }
    return c_gray;
}

// Icons and sounds extracted from Dota, loaded once from <game dir>/invoker_arena/ (missing files are skipped).
function inv_arena_assets()
{
    static assets = undefined;
    if (!is_undefined(assets))
    {
        return assets;
    }
    var _dir = working_directory + "invoker_arena/";
    assets = { icons: {}, sounds: {}, voices: {} };
    var _icons = [
        "quas", "wex", "exort", "invoke", "cold_snap", "ghost_walk", "tornado", "emp", "alacrity", "chaos_meteor",
        "sun_strike", "forge_spirit", "ice_wall", "deafening_blast", "sheepstick", "shivas_guard", "refresher",
        "ultimate_scepter", "black_king_bar", "blink", "invoker", "axe"
    ];
    for (var i = 0; i < array_length(_icons); i++)
    {
        var _icon = _dir + "icons/" + _icons[i] + ".png";
        if (file_exists(_icon))
        {
            variable_struct_set(assets.icons, _icons[i], sprite_add(_icon, 1, false, false, 0, 0));
        }
    }
    var _sounds = [
        "invoke", "cold_snap", "ghost_walk", "tornado_cast", "emp_cast", "emp_discharge", "alacrity", "meteor_cast",
        "meteor_impact", "sunstrike_charge", "sunstrike_ignite", "deafening_blast", "glacier_cast",
        "black_king_bar", "refresher", "shivas_guard", "blink"
    ];
    for (var j = 0; j < array_length(_sounds); j++)
    {
        var _sound = _dir + "sounds/" + _sounds[j] + ".ogg";
        if (file_exists(_sound))
        {
            variable_struct_set(assets.sounds, _sounds[j], audio_create_stream(_sound));
        }
    }
    var _voices = ["invoke", "tornado", "emp", "chaosmeteor", "sunstrike", "coldsnap", "deafeningblast", "icewall", "forgespirit", "alacrity", "ghostwalk"];
    for (var k = 0; k < array_length(_voices); k++)
    {
        var _lines = [];
        for (var n = 1; n <= 20; n++)
        {
            var _line = _dir + "vo/" + _voices[k] + "_" + ((n < 10) ? "0" : "") + string(n) + ".ogg";
            if (file_exists(_line))
            {
                array_push(_lines, audio_create_stream(_line));
            }
        }
        variable_struct_set(assets.voices, _voices[k], _lines);
    }
    return assets;
}

function inv_arena_icon(_key)
{
    var _icons = inv_arena_assets().icons;
    return variable_struct_exists(_icons, _key) ? variable_struct_get(_icons, _key) : -1;
}

function inv_arena_play(_name)
{
    var _sounds = inv_arena_assets().sounds;
    if (variable_struct_exists(_sounds, _name))
    {
        audio_play_sound(variable_struct_get(_sounds, _name), 10, false);
    }
}

// Invoker speaks at most once every 2.5 s, like Dota's voice line throttling.
function inv_arena_voice(_a, _key, _chance)
{
    var _lines = variable_struct_get(inv_arena_assets().voices, _key);
    if (!is_array(_lines) || array_length(_lines) == 0 || _a.voice_cd > 0 || random(1) > _chance)
    {
        return;
    }
    audio_play_sound(_lines[irandom(array_length(_lines) - 1)], 20, false);
    _a.voice_cd = 2.5;
}

function inv_arena_cast_feedback(_a, _result, _is_invoke)
{
    if (_is_invoke)
    {
        inv_arena_play("invoke");
        inv_arena_voice(_a, "invoke", 0.3);
        return;
    }
    switch (_result)
    {
        case "tornado": inv_arena_play("tornado_cast"); inv_arena_voice(_a, "tornado", 0.7); break;
        case "emp": inv_arena_play("emp_cast"); inv_arena_voice(_a, "emp", 0.7); break;
        case "chaos_meteor": inv_arena_play("meteor_cast"); inv_arena_voice(_a, "chaosmeteor", 0.7); break;
        case "sun_strike": case "cataclysm": inv_arena_play("sunstrike_charge"); inv_arena_voice(_a, "sunstrike", 0.7); break;
        case "cold_snap": inv_arena_play("cold_snap"); inv_arena_voice(_a, "coldsnap", 0.7); break;
        case "deafening_blast": inv_arena_play("deafening_blast"); inv_arena_voice(_a, "deafeningblast", 0.7); break;
        case "ice_wall": inv_arena_play("glacier_cast"); inv_arena_voice(_a, "icewall", 0.7); break;
        case "forge_spirit": inv_arena_voice(_a, "forgespirit", 0.7); break;
        case "alacrity": inv_arena_play("alacrity"); inv_arena_voice(_a, "alacrity", 0.7); break;
        case "ghost_walk": inv_arena_play("ghost_walk"); inv_arena_voice(_a, "ghostwalk", 0.7); break;
        case "black_king_bar": case "refresher": case "shivas_guard": case "blink": inv_arena_play(_result); break;
    }
}

function inv_arena_action(_a, _action, _mx, _my)
{
    if (is_undefined(_action))
    {
        return;
    }
    var _w = _a.world;
    var _result = undefined;
    switch (_action)
    {
        case "quas": inv_press_orb(_w.caster, "q"); return;
        case "wex": inv_press_orb(_w.caster, "w"); return;
        case "exort": inv_press_orb(_w.caster, "e"); return;
        case "invoke": _result = inv_invoke(_w.caster); break;
        case "slot1": _result = inv_world_cast_slot(_w, 0, _mx, _my); break;
        case "slot2": _result = inv_world_cast_slot(_w, 1, _mx, _my); break;
        default: _result = inv_world_use_item(_w, real(string_char_at(_action, 5)), _mx, _my); break;
    }
    if (!is_undefined(_result))
    {
        var _labels = 0;
        for (var i = 0; i < array_length(_a.floaters); i++)
        {
            if (_a.floaters[i].kind == "label")
            {
                _labels++;
            }
        }
        var _text = (_action == "invoke") ? "Invoke: " + inv_arena_label(_result) : inv_arena_label(_result);
        array_push(_a.floaters, { kind: "label", x: _w.hero.x, y: _w.hero.y - 160 - 70 * _labels, life: 1.4, text: _text, color: inv_arena_spell_color(_result) });
        inv_arena_cast_feedback(_a, _result, _action == "invoke");
    }
}

function inv_arena_step(_a)
{
    var _w = _a.world;
    var _dt = min(delta_time / 1000000, 0.1);
    var _mx = inv_arena_mouse_wx();
    var _my = inv_arena_mouse_wy();
    if (keyboard_check_pressed(vk_backspace))
    {
        inv_arena_reset(_a);
        _w = _a.world;
    }
    var _keys = [81, 87, 69, 70, 82, 68, 90, 88, 67, 86, 20, 32];
    for (var i = 0; i < array_length(_keys); i++)
    {
        if (keyboard_check_pressed(_keys[i]))
        {
            inv_arena_action(_a, inv_key_action(_keys[i]), _mx, _my);
        }
    }
    if (mouse_check_button_pressed(mb_right))
    {
        if (point_distance(_mx, _my, _w.axe.x, _w.axe.y) <= 150)
        {
            inv_world_order_attack(_w);
        }
        else
        {
            inv_world_order_move(_w, _mx, _my);
        }
        array_push(_a.floaters, { kind: "click", x: _mx, y: _my, life: 0.35, text: "", color: c_lime });
    }
    if (_a.autotest)
    {
        inv_arena_autotest_step(_a, _dt);
    }
    // Delayed strikes that go off this frame leave a flash where they landed; landings get their sound once per frame.
    var _sun_sound = false;
    var _emp_sound = false;
    var _meteor_sound = false;
    for (var j = 0; j < array_length(_w.effects); j++)
    {
        var _e = _w.effects[j];
        if ((_e.kind == "sun_strike" || _e.kind == "emp") && _e.delay - _dt <= 0)
        {
            var _sun = (_e.kind == "sun_strike");
            _sun_sound |= _sun;
            _emp_sound |= !_sun;
            array_push(_a.floaters, {
                kind: "flash", x: _e.x, y: _e.y, life: 0.5, text: "",
                radius: _sun ? 175 : 675, color: _sun ? make_color_rgb(255, 230, 120) : make_color_rgb(200, 120, 255)
            });
        }
        if (_e.kind == "meteor" && !_e.landed && _e.land_left - _dt <= 0)
        {
            _meteor_sound = true;
        }
    }
    if (_sun_sound) inv_arena_play("sunstrike_ignite");
    if (_emp_sound) inv_arena_play("emp_discharge");
    if (_meteor_sound) inv_arena_play("meteor_impact");
    _a.voice_cd = max(0, _a.voice_cd - _dt);
    inv_world_tick(_w, _dt);
    inv_arena_collect_events(_a, _dt);
}

function inv_arena_collect_events(_a, _dt)
{
    var _w = _a.world;
    for (var i = 0; i < array_length(_w.events); i++)
    {
        var _e = _w.events[i];
        if (_e.kind != "damage")
        {
            continue;
        }
        if (_a.combo_idle > 5)
        {
            _a.combo_damage = 0;
        }
        _a.combo_damage += _e.amount;
        _a.combo_idle = 0;
        var _color = (_e.type == "pure") ? make_color_rgb(255, 225, 90) : ((_e.type == "physical") ? make_color_rgb(255, 90, 80) : make_color_rgb(120, 180, 255));
        array_push(_a.floaters, {
            kind: "number", x: _w.axe.x + random_range(-60, 60), y: _w.axe.y - 90, life: 1.1,
            text: string(round(_e.amount)), color: _color
        });
    }
    _w.events = [];
    _a.combo_idle += _dt;
    for (var j = array_length(_a.floaters) - 1; j >= 0; j--)
    {
        var _f = _a.floaters[j];
        _f.life -= _dt;
        if (_f.kind == "number" || _f.kind == "label")
        {
            _f.y -= 120 * _dt;
        }
        if (_f.life <= 0)
        {
            array_delete(_a.floaters, j, 1);
        }
    }
}

// Scripted combo for the headless end-to-end check (game started with -inv_autotest).
function inv_arena_autotest_step(_a, _dt)
{
    _a.auto_time += _dt;
    var _w = _a.world;
    var _script = [
        [0.5, "orbs", "wwq"], [0.6, "invoke"], [0.7, "orbs", "www"], [0.8, "invoke"],
        [1.0, "slot2"], [1.1, "slot1"], [1.2, "orbs", "eew"], [1.3, "invoke"], [1.4, "slot1"],
        [1.9, "mark", "combo1"],
        [3.0, "orbs", "qwe"], [3.1, "invoke"], [3.4, "slot1"], [3.6, "item1"],
        [3.8, "orbs", "eee"], [3.9, "invoke"], [4.0, "slot1"], [4.1, "slot1"],
        [4.6, "mark", "combo2"],
        [5.5, "orbs", "qqq"], [5.6, "invoke"], [5.7, "slot1"], [5.8, "item4"],
        [5.9, "orbs", "eeq"], [6.0, "invoke"], [6.1, "slot1"], [6.2, "item0"],
        [6.8, "mark", "combo3"],
        [9.0, "mark", "done"]
    ];
    while (_a.auto_step < array_length(_script) && _a.auto_time >= _script[_a.auto_step][0])
    {
        var _cmd = _script[_a.auto_step];
        _a.auto_step++;
        switch (_cmd[1])
        {
            case "orbs":
                for (var i = 1; i <= string_length(_cmd[2]); i++)
                {
                    inv_press_orb(_w.caster, string_char_at(_cmd[2], i));
                }
                break;
            case "mark":
                inv_arena_mark(_cmd[2]);
                break;
            default:
                inv_arena_action(_a, _cmd[1], _w.axe.x, _w.axe.y);
                break;
        }
    }
}

function inv_arena_circle(_x, _y, _r, _color, _alpha, _outline)
{
    draw_set_color(_color);
    draw_set_alpha(_alpha);
    draw_circle(inv_arena_gx(_x), inv_arena_gy(_y), max(1, _r * inv_arena_scale()), _outline);
    draw_set_alpha(1);
}

function inv_arena_draw_gui(_a)
{
    var _w = _a.world;
    var _gw = display_get_gui_width();
    var _gh = display_get_gui_height();
    draw_set_font(-1);
    draw_set_alpha(0.35);
    draw_set_color(c_black);
    draw_rectangle(0, 0, _gw, _gh, false);
    draw_set_alpha(1);
    inv_arena_draw_effects(_a);
    inv_arena_draw_axe(_a);
    inv_arena_draw_hero(_a);
    inv_arena_draw_floaters(_a);
    inv_arena_draw_hud(_a, _gw, _gh);
    draw_set_alpha(1);
    draw_set_color(c_white);
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
}

function inv_arena_draw_effects(_a)
{
    var _w = _a.world;
    var _c = _w.caster;
    var _t = current_time / 1000;
    for (var i = 0; i < array_length(_w.effects); i++)
    {
        var _e = _w.effects[i];
        switch (_e.kind)
        {
            case "sun_strike":
                var _p = 1 - _e.delay / inv_spell_value(_c, "sun_strike", "delay");
                inv_arena_circle(_e.x, _e.y, 175, make_color_rgb(255, 220, 90), 0.15 + 0.45 * _p, false);
                inv_arena_circle(_e.x, _e.y, 175, make_color_rgb(255, 240, 160), 0.9, true);
                break;
            case "emp":
                inv_arena_circle(_e.x, _e.y, 675, make_color_rgb(200, 120, 255), 0.12, false);
                inv_arena_circle(_e.x, _e.y, 675, make_color_rgb(220, 160, 255), 0.8, true);
                inv_arena_circle(_e.x, _e.y, 60 + 30 * sin(_t * 12), make_color_rgb(230, 190, 255), 0.8, false);
                break;
            case "tornado":
                for (var k = 0; k < 4; k++)
                {
                    inv_arena_circle(_e.x + lengthdir_x(30, _t * 600 + k * 90), _e.y + lengthdir_y(30, _t * 600 + k * 90), 200 - k * 40, make_color_rgb(230, 230, 255), 0.25, false);
                }
                break;
            case "twister":
                inv_arena_circle(_e.x, _e.y, 150, make_color_rgb(210, 210, 240), 0.18, false);
                inv_arena_circle(_e.x + lengthdir_x(20, _t * 720), _e.y + lengthdir_y(20, _t * 720), 60, c_white, 0.35, false);
                break;
            case "meteor":
                if (!_e.landed)
                {
                    inv_arena_circle(_e.x, _e.y, 275 * (1 - _e.land_left / 1.3), c_black, 0.35, false);
                    inv_arena_circle(_e.x - _e.land_left * 250, _e.y - _e.land_left * 500, 70, make_color_rgb(255, 120, 40), 1, false);
                }
                else
                {
                    inv_arena_circle(_e.x, _e.y, 275, make_color_rgb(255, 110, 30), 0.2, false);
                    inv_arena_circle(_e.x, _e.y, 75, make_color_rgb(255, 90, 20), 1, false);
                    inv_arena_circle(_e.x, _e.y, 45, make_color_rgb(255, 210, 90), 1, false);
                }
                break;
            case "blast":
                var _r = 175 + 50 * _e.travelled / 1000;
                inv_arena_circle(_e.x, _e.y, _r, make_color_rgb(170, 255, 220), 0.25, false);
                inv_arena_circle(_e.x, _e.y, _r, make_color_rgb(220, 255, 240), 0.8, true);
                break;
            case "ice_wall":
                var _half = inv_spell_value(_c, "ice_wall", "wall_total_length") / 2;
                draw_set_color(make_color_rgb(150, 220, 255));
                draw_set_alpha((_e.form_left > 0) ? 0.3 : 0.85);
                draw_line_width(
                    inv_arena_gx(_e.x - lengthdir_x(_half, _e.dir)), inv_arena_gy(_e.y - lengthdir_y(_half, _e.dir)),
                    inv_arena_gx(_e.x + lengthdir_x(_half, _e.dir)), inv_arena_gy(_e.y + lengthdir_y(_half, _e.dir)),
                    inv_spell_value(_c, "ice_wall", "wall_width") * inv_arena_scale()
                );
                draw_set_alpha(1);
                break;
            case "spirit":
                inv_arena_circle(_e.x, _e.y, 38, make_color_rgb(255, 120, 40), 1, false);
                inv_arena_circle(_e.x, _e.y, 22, make_color_rgb(120, 200, 255), 1, false);
                break;
            case "shiva":
                inv_arena_circle(_e.x, _e.y, _e.radius, make_color_rgb(140, 210, 255), 0.9, true);
                inv_arena_circle(_e.x, _e.y, _e.radius, make_color_rgb(140, 210, 255), 0.1, false);
                break;
        }
    }
}

function inv_arena_draw_axe(_a)
{
    var _w = _a.world;
    var _x = _w.axe.x;
    var _y = _w.axe.y;
    var _ax = _w.axe;
    var _gx = inv_arena_gx(_x);
    var _gy = inv_arena_gy(_y);
    if (!_ax.alive)
    {
        draw_set_halign(fa_center);
        draw_set_color(c_white);
        draw_text(_gx, _gy, "Axe respawns in " + string_format(_ax.respawn_left, 1, 1) + "s");
        draw_set_halign(fa_left);
        return;
    }
    var _lift = (_ax.lift_left > 0) ? 90 : 0;
    if (_lift > 0)
    {
        inv_arena_circle(_x, _y, 120, make_color_rgb(230, 230, 255), 0.3, false);
    }
    var _pig = asset_get_index("spr_pet_pig");
    if (_ax.hexed_left > 0 && _pig >= 0)
    {
        draw_sprite_ext(_pig, 0, _gx, _gy - _lift * inv_arena_scale(), 1.5, 1.5, 0, c_white, 1);
    }
    else
    {
        inv_arena_circle(_x, _y - _lift, 55, make_color_rgb(170, 30, 30), 1, false);
        inv_arena_circle(_x, _y - _lift, 55, make_color_rgb(255, 80, 60), 1, true);
        if (!inv_arena_draw_token(inv_arena_icon("axe"), _x, _y - _lift, 1))
        {
            draw_set_halign(fa_center);
            draw_set_valign(fa_middle);
            draw_set_color(c_white);
            draw_text(_gx, inv_arena_gy(_y - _lift), "AXE");
            draw_set_valign(fa_top);
            draw_set_halign(fa_left);
        }
    }
    if (_ax.frozen_left > 0 || _ax.rooted_left > 0)
    {
        inv_arena_circle(_x, _y - _lift, 70, make_color_rgb(150, 220, 255), 0.5, false);
    }
    if (_ax.cold_snap_left > 0)
    {
        inv_arena_circle(_x, _y - _lift, 75, make_color_rgb(120, 200, 255), 1, true);
    }
    if (_ax.burn_left > 0)
    {
        inv_arena_circle(_x, _y - _lift, 85, make_color_rgb(255, 120, 30), 1, true);
    }
    var _bw = 150;
    var _by = _gy - (_lift + 95) * inv_arena_scale() - 20;
    draw_healthbar(_gx - _bw / 2, _by, _gx + _bw / 2, _by + 10, 100 * _ax.hp / _ax.max_hp, c_black, c_red, c_lime, 0, true, true);
    draw_healthbar(_gx - _bw / 2, _by + 12, _gx + _bw / 2, _by + 17, 100 * _ax.mana / _ax.max_mana, c_black, c_blue, make_color_rgb(80, 140, 255), 0, true, false);
    draw_set_halign(fa_center);
    draw_set_color(c_white);
    draw_text(_gx, _by - 18, string(round(_ax.hp)) + " / " + string(round(_ax.max_hp)));
    var _status = "";
    if (_ax.lift_left > 0) _status += "TORNADO ";
    if (_ax.hexed_left > 0) _status += "HEX ";
    if (_ax.frozen_left > 0) _status += "FROZEN ";
    if (_ax.rooted_left > 0) _status += "ROOTED ";
    if (_ax.disarmed_left > 0) _status += "DISARMED ";
    if (_ax.slowed_left > 0) _status += "SLOWED ";
    draw_set_color(make_color_rgb(180, 220, 255));
    draw_text(_gx, inv_arena_gy(_y) + 75 * inv_arena_scale(), _status);
    draw_set_halign(fa_left);
}

// Draws a 32x32 Dota hero icon centred on a world position; returns false when the icon is missing.
function inv_arena_draw_token(_icon, _x, _y, _alpha)
{
    if (_icon < 0)
    {
        return false;
    }
    var _k = 80 * inv_arena_scale() / 32;
    draw_sprite_ext(_icon, 0, inv_arena_gx(_x) - 16 * _k, inv_arena_gy(_y) - 16 * _k, _k, _k, 0, c_white, _alpha);
    return true;
}

function inv_arena_draw_hero(_a)
{
    var _w = _a.world;
    var _h = _w.hero;
    var _alpha = (_h.invisible_left > 0) ? 0.35 : 1;
    var _t = current_time / 1000;
    if (_h.bkb_left > 0)
    {
        inv_arena_circle(_h.x, _h.y, 75, make_color_rgb(255, 215, 80), 0.35 * _alpha + 0.15, false);
    }
    if (_h.alacrity_left > 0)
    {
        inv_arena_circle(_h.x, _h.y, 65, make_color_rgb(255, 170, 80), _alpha, true);
    }
    inv_arena_circle(_h.x, _h.y, 50, make_color_rgb(70, 40, 110), _alpha, false);
    inv_arena_circle(_h.x, _h.y, 50, make_color_rgb(230, 200, 120), _alpha, true);
    inv_arena_draw_token(inv_arena_icon("invoker"), _h.x, _h.y, _alpha);
    draw_set_alpha(_alpha);
    draw_set_color(make_color_rgb(230, 200, 120));
    draw_line_width(inv_arena_gx(_h.x), inv_arena_gy(_h.y), inv_arena_gx(_h.x + lengthdir_x(80, _h.facing)), inv_arena_gy(_h.y + lengthdir_y(80, _h.facing)), 3);
    draw_set_alpha(1);
    var _orbs = _w.caster.orbs;
    for (var i = 0; i < array_length(_orbs); i++)
    {
        var _ang = _t * 120 + i * 120;
        inv_arena_circle(_h.x + lengthdir_x(85, _ang), _h.y + lengthdir_y(85, _ang), 20, inv_arena_orb_color(_orbs[i]), _alpha, false);
    }
}

function inv_arena_draw_floaters(_a)
{
    draw_set_halign(fa_center);
    for (var i = 0; i < array_length(_a.floaters); i++)
    {
        var _f = _a.floaters[i];
        switch (_f.kind)
        {
            case "flash":
                inv_arena_circle(_f.x, _f.y, _f.radius * (1.2 - _f.life), _f.color, _f.life * 1.6, false);
                break;
            case "click":
                inv_arena_circle(_f.x, _f.y, 40 * _f.life / 0.35, _f.color, 1, true);
                break;
            default:
                draw_set_alpha(min(1, _f.life * 2));
                draw_set_color(c_black);
                draw_text_transformed(inv_arena_gx(_f.x) + 2, inv_arena_gy(_f.y) + 2, _f.text, 1.6, 1.6, 0);
                draw_set_color(_f.color);
                draw_text_transformed(inv_arena_gx(_f.x), inv_arena_gy(_f.y), _f.text, 1.6, 1.6, 0);
                draw_set_alpha(1);
                break;
        }
    }
    draw_set_halign(fa_left);
}

function inv_arena_draw_box(_x, _y, _w, _h, _icon, _title, _key, _color, _left, _total)
{
    draw_set_color(make_color_rgb(20, 20, 28));
    draw_rectangle(_x, _y, _x + _w, _y + _h, false);
    if (_icon >= 0)
    {
        draw_sprite_stretched(_icon, 0, _x, _y, _w, _h);
    }
    else if (_title != "")
    {
        draw_set_color(_color);
        draw_set_alpha(0.35);
        draw_rectangle(_x + 3, _y + 3, _x + _w - 3, _y + _h - 3, false);
        draw_set_alpha(1);
        draw_set_halign(fa_center);
        draw_set_color(c_white);
        draw_text_transformed(_x + _w / 2, _y + _h / 2 - 6, _title, 0.8, 0.8, 0);
    }
    draw_set_color(_color);
    draw_rectangle(_x, _y, _x + _w, _y + _h, true);
    if (_left > 0.05)
    {
        draw_set_alpha(0.7);
        draw_set_color(c_black);
        draw_rectangle(_x + 1, _y + 1, _x + _w - 1, _y + 1 + (_h - 2) * min(1, _left / max(_total, 0.01)), false);
        draw_set_alpha(1);
        draw_set_halign(fa_center);
        draw_set_color(c_white);
        draw_text_transformed(_x + _w / 2, _y + _h / 2 - 12, string(ceil(_left)), 1.5, 1.5, 0);
    }
    draw_set_halign(fa_left);
    draw_set_color(c_black);
    draw_text_transformed(_x + 3, _y + 2, _key, 0.8, 0.8, 0);
    draw_set_color(make_color_rgb(255, 230, 150));
    draw_text_transformed(_x + 2, _y + 1, _key, 0.8, 0.8, 0);
}

function inv_arena_draw_hud(_a, _gw, _gh)
{
    var _w = _a.world;
    var _c = _w.caster;
    var _size = 64;
    var _gap = 5;
    var _iw = 55;
    var _ih = 40;
    var _x0 = _gw / 2 - (6 * (_size + _gap) + 14 + 3 * (_iw + 4)) / 2;
    var _y0 = _gh - _size - 16;
    var _orbs = _c.orbs;
    for (var o = 0; o < 3; o++)
    {
        draw_set_color((o < array_length(_orbs)) ? inv_arena_orb_color(_orbs[o]) : make_color_rgb(40, 40, 50));
        draw_circle(_x0 + (_size + _gap) * 1.5 + (o - 1) * 30, _y0 - 16, 11, false);
    }
    var _orb_keys = ["quas", "wex", "exort"];
    var _orb_letters = ["Q", "W", "E"];
    for (var i = 0; i < 3; i++)
    {
        inv_arena_draw_box(_x0 + i * (_size + _gap), _y0, _size, _size, inv_arena_icon(_orb_keys[i]), _orb_keys[i], _orb_letters[i], inv_arena_orb_color(string_char_at("qwe", i + 1)), 0, 1);
    }
    var _slot_keys = ["F", "R"];
    for (var s = 0; s < 2; s++)
    {
        var _spell = _c.slots[s];
        var _sx = _x0 + (3 + s) * (_size + _gap);
        if (is_undefined(_spell))
        {
            inv_arena_draw_box(_sx, _y0, _size, _size, -1, "", _slot_keys[s], make_color_rgb(60, 60, 70), 0, 1);
        }
        else
        {
            inv_arena_draw_box(_sx, _y0, _size, _size, inv_arena_icon(_spell), inv_arena_label(_spell), _slot_keys[s], inv_arena_spell_color(_spell), inv_cooldown_left(_c, _spell), inv_spell_cooldown(_c, _spell));
        }
    }
    inv_arena_draw_box(_x0 + 5 * (_size + _gap), _y0, _size, _size, inv_arena_icon("invoke"), "Invoke", "D", make_color_rgb(230, 200, 120), inv_cooldown_left(_c, "invoke"), max(inv_invoke_cooldown(_c), 1));
    var _item_keys = ["Z", "X", "C", "V", "CAPS", "SPACE"];
    var _ix0 = _x0 + 6 * (_size + _gap) + 14;
    for (var j = 0; j < 6; j++)
    {
        var _item = _c.items[j];
        var _cd = inv_item_cooldown(_item);
        inv_arena_draw_box(
            _ix0 + (j mod 3) * (_iw + 4), _y0 - 18 + (j div 3) * (_ih + 4), _iw, _ih,
            inv_arena_icon(_item), inv_arena_label(_item), _item_keys[j], make_color_rgb(150, 150, 170),
            inv_cooldown_left(_c, _item), is_undefined(_cd) ? 1 : _cd
        );
    }
    draw_set_color(c_white);
    draw_text(16, 12, "INVOKER ARENA  |  I: exit   Backspace: reset   RMB: move / attack Axe   double-tap Sun Strike: Cataclysm");
    draw_text(16, 32, "Invoker lvl 30, Quas/Wex/Exort 9/9/9 (Aghanim's), all talents");
    var _ax = _w.axe;
    draw_text(16, 52, "Axe lvl 30, 6x Heart of Tarrasque  |  regen " + string(round(_ax.flat_regen + _ax.missing_regen_pct / 100 * (_ax.max_hp - _ax.hp))) + "/s  |  magic res " + string_format(_ax.magic_resistance * 100, 1, 1) + "%");
    draw_set_halign(fa_center);
    draw_set_color(make_color_rgb(255, 220, 120));
    draw_text_transformed(_gw / 2, 80, "COMBO DAMAGE: " + string(round(_a.combo_damage)), 2, 2, 0);
    draw_set_halign(fa_left);
}
