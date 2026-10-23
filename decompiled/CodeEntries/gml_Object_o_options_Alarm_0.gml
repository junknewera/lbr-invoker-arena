if (get_option(global.options.mute_when_afk))
{
    if (is_afk())
    {
        if (audio_is_playing(track))
        {
            audio_sound_gain(track_res, 0, 0);
        }
    }
    else
    {
        audio_sound_gain(track_res, get_option(global.options.volume_music) / 100, 0);
    }
}
if (get_option(global.options.volume_music) == 0 || global.options.volume_music.data.checked || get_option(global.options.volume_master) == 0 || global.options.volume_master.data.checked)
{
    alarm[0] = sec(0.5);
    exit;
}
if (!audio_is_playing(track))
{
    if (track_last == track_index)
    {
        track_index++;
        if (track_index >= array_length(tracks))
        {
            track_index = 0;
        }
        track = tracks[track_index];
    }
    if (instance_exists(o_game))
    {
        o_game.data.track_index = track_index;
    }
    track_last = track_index;
    track_res = audio_play_sound(track, 10, false);
    audio_sound_gain(track_res, get_option(global.options.volume_music) / 100, 0);
}
alarm[0] = sec(1);
