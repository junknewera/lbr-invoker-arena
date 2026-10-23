function init_merge_resources()
{
    global.leaf_merge = 
    {
        obsidian: 
        {
            from: [
            {
                resource: global.resources.lava,
                count: 3
            }, 
            {
                resource: global.resources.ice,
                count: 3
            }],
            to: [
            {
                resource: global.resources.obsidian,
                count: 2
            }]
        },
        benitoite: 
        {
            from: [
            {
                resource: global.resources.ice,
                count: 5
            }, 
            {
                resource: global.resources.silicon,
                count: 10
            }],
            to: [
            {
                resource: global.resources.benitoite,
                count: 1
            }]
        }
    };
    _map(global.leaf_merge, function(arg0)
    {
        arg0.from_keys = {};
        arg0.from[0].resource.merge_check_active = true;
        _map(arg0.from, function(arg0, arg1, arg2)
        {
            variable_struct_set(arg2, arg0.resource.key, arg0);
            arg0.resource.merge_check_passive = true;
            arg0.resource.merge_check = true;
        }, arg0.from_keys);
    }, false);
}
