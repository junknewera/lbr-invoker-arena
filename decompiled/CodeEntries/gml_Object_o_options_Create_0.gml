single_object();
tracks = [s_music01, s_music02, s_music03, s_music04, s_music05, s_music06, s_music07, s_music08, s_music09, s_music10, s_music11, s_music12, s_music13, s_music14, s_music15, s_music16, s_music17, s_music18, s_music19, s_music20];
track_index = 0;
track = tracks[track_index];
track_last = -1;
track_res = -1;

init = function(arg0 = false)
{
    if (!arg0)
    {
        var __struct = global.options;
        var __prop_names = struct_get_names(__struct);
        var __prop_len = array_length(__prop_names);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mkey = __prop_names[__i];
            var mitem = variable_struct_get(__struct, mkey);
            call_method(mitem, mitem.change, [false, mitem.data.value]);
        }
    }
    alarm[0] = sec(0.5);
    if (instance_exists(o_game))
    {
        track_index = clamp(o_game.data.track_index, 0, array_length(tracks) - 1);
    }
    track = tracks[track_index];
    audio_stop_all();
};

init(true);
