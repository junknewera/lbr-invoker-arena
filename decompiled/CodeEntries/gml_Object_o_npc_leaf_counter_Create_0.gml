event_inherited();
titles = 
{
    title: __("Leaf Counter"),
    subtitle: sprintf(__("#leaf-counter. Every %s counts increases leaf blower damage by %s, every %s by %s, every %s by %s, every %s by %s."), 10, number_format_percent(0.001), 100, number_format_percent(0.005), 1000, number_format_percent(0.01), 10000, number_format_percent(0.05))
};
actions = [new Gui_Item(UnknownEnum.Value_23, id, {})];

enum UnknownEnum
{
    Value_23 = 23
}
