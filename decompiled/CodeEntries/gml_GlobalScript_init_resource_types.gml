function init_resource_types()
{
    global.resource_types = 
    {
        currency: 
        {
            key: "currency",
            index: 100
        },
        energy: 
        {
            key: "energy",
            index: 200
        },
        token: 
        {
            key: "token",
            index: 300
        },
        leaf: 
        {
            key: "leaf",
            index: 400
        },
        flask: 
        {
            key: "flask",
            index: 500
        },
        misc: 
        {
            key: "misc",
            index: 600
        },
        plant: 
        {
            key: "plant",
            index: 650
        },
        butterfly: 
        {
            key: "butterfly",
            index: 660
        },
        event: 
        {
            key: "event",
            index: 700
        }
    };
    global.resource_types_array = struct_to_sorted_array(global.resource_types);
}
