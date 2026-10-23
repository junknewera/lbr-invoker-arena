function save_autobuy_priorities(arg0)
{
    var priorities = get_autobuy_priorities();
    variable_struct_set(global.autobuy_priorities, arg0, priorities);
}
