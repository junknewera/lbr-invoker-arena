if (!is_struct(resource) || !is_struct(other.resource))
{
    exit;
}
if (other.resource.key != resource.key)
{
    exit;
}
value += other.value;
text = number_format(value);
alarm[0] = lifetime;
alarm[1] = lifetime * 2;
with (other)
{
    destroy();
}
