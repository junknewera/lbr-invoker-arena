draw_self();
var count = container.data.count;
var max_count = container.get_max_storage();
var pct = calc_percent(count, max_count) / 100;
var text = sprintf("%s/%s\n(%s)", number_format(count), number_format(max_count), number_format_percent(pct, 0));
draw_description(x, y - 20, text, undefined, 1, 2, undefined, undefined, f_game_small);
