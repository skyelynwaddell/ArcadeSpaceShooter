timer++;
//y -= yspd

if timer > scale {
	y = spawn.Y;
	timer = 0;
}