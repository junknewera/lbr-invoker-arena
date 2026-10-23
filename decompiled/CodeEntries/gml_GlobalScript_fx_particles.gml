function fx_particles(arg0, arg1, arg2)
{
    var o = instance_create_layer(arg0, arg1, global.layers.fx, o_fx_particle);
    o.init(arg2);
}
