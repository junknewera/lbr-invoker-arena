event_inherited();
positions = [
{
    x: room_width / 2,
    y: room_height / 2
}, 
{
    x: (room_width / 2) - 250,
    y: room_height / 2
}, 
{
    x: (room_width / 2) + 250,
    y: room_height / 2
}, 
{
    x: room_width / 2,
    y: (room_height / 2) - 150
}, 
{
    x: room_width / 2,
    y: (room_height / 2) + 150
}];

init = function()
{
    instance_destroy(o_harbor_container);
    var container_count = global.harbor.container.get_max_count();
    for (var i = 0; i < container_count; i++)
    {
        var o = instance_create_layer(room_width / 2, room_height / 2, global.layers.npc, o_harbor_container);
        if (i < array_length(positions))
        {
            var pos = positions[i];
            o.x = pos.x;
            o.y = pos.y;
        }
    }
};
