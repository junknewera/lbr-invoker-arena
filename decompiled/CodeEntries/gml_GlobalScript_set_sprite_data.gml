function set_sprite_data(arg0)
{
    if (!is_struct(arg0))
    {
        exit;
    }
    if (is_undefined(struct_get_from_hash(arg0, variable_get_hash("sprite"))))
    {
        arg0.sprite = spr_solid;
    }
    arg0.sprite_name = sprite_get_name(arg0.sprite);
    arg0.sprite_data = 
    {
        w: sprite_get_width(arg0.sprite),
        h: sprite_get_height(arg0.sprite),
        offset: 
        {
            x: sprite_get_xoffset(arg0.sprite),
            y: sprite_get_yoffset(arg0.sprite)
        }
    };
    arg0.sprite_data.position = 
    {
        left: (arg0.sprite_data.w / 2) - arg0.sprite_data.offset.x,
        top: (arg0.sprite_data.h / 2) - arg0.sprite_data.offset.y
    };
}
