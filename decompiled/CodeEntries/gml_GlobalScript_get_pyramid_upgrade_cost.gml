function get_pyramid_upgrade_cost()
{
    var cost = 
    {
        ancient: 150,
        beer: 20,
        cheese: 75,
        mulch: 5000
    };
    cost = multiply_struct_values(cost, power(global.areas.inner_pyramid.data.highest_floor, 2));
    return cost;
}
