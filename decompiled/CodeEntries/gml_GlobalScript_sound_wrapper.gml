function snd_play(arg0)
{
    if (get_option(global.options.mute_when_afk) && is_afk())
    {
        exit;
    }
    var snd_res = audio_play_sound(arg0, 1, false);
    var sound_volume = get_option(global.options.volume_sfx) / 100;
    if (global.options.volume_sfx.data.checked)
    {
        sound_volume = 0;
    }
    audio_sound_gain(snd_res, sound_volume, 0);
}

function Script779()
{
}
