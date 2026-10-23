var inc_value_s = get_soul_forge_count_inc();
var inc_value_m = inc_value_s * 60;
var inc_value_h = inc_value_m * 60;
var complete_count = get_soul_forge_complete_count();
var soul_count = global.resources.soul_empty.data.count;
var soul_count_pct = soul_count / next_level;
var time_left_until_next_cycle = "-";
if (inc_value_s > 0)
{
    var diff = (next_level - soul_count) / inc_value_s;
    time_left_until_next_cycle = format_time(diff, undefined, true);
}
text = sprintf("%s/%s", number_format(soul_count), number_format(next_level));
text += "\n";
text += sprintf("%s, %s", number_format_percent(soul_count_pct), time_left_until_next_cycle);
text += "\n";
text += sprintf("%s/s, +%s/%s", number_format(inc_value_s), number_format(complete_count), __("cycle"));
alarm[0] = sec(0.3);
