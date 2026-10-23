function get_profile_resource(arg0, arg1, arg2)
{
    if (arg0 == global.current_profile)
    {
        profile_res = variable_struct_get(global.resources, arg1.key);
        if (!is_undefined(arg2))
        {
            return variable_struct_get(profile_res.data, arg2);
        }
        return profile_res;
    }
    var _profile = variable_struct_get(global.profiles, arg0);
    if (is_undefined(struct_get_from_hash(_profile, variable_get_hash("resources"))) || is_undefined(variable_struct_get(_profile.resources, arg1.key)))
    {
        return 0;
    }
    var profile_res = variable_struct_get(_profile.resources, arg1.key);
    if (!is_undefined(arg2))
    {
        return variable_struct_get(profile_res, arg2);
    }
    return profile_res;
}
