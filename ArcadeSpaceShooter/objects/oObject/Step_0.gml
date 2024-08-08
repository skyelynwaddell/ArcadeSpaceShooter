if instance_exists(oPlayer)
{
	if distance_to_object(oPlayer) > 300 {
		instance_destroy(id)
	}
}

