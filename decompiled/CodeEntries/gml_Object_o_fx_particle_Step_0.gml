if (!fade)
{
    exit;
}
alpha = lerp(alpha, alpha_target, 0.1);
part_type_alpha3(part_particle, alpha, alpha, alpha);
