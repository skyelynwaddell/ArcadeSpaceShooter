function PlayerAcceleration(){
	
	//Horizontal Movement
    //if we are moving
    if dirx != 0 {
        //acceleerate in direction of input
        xspd += dirx * acceleration;
        //limit max spd
        if abs(xspd) > spd
            xspd = sign(xspd) * spd;
    }  
    //not moving
    else if dirx == 0 {
        //decelerate when no input is given
        if xspd > 0 {
            xspd -= frict;
            if xspd < 0 xspd = 0;
                } else if xspd < 0 {
            xspd += frict
            if xspd > 0 xspd = 0;
                }
    }
	
	//Vertical Movement
    //if we are moving
    if diry != 0 {
        //acceleerate in direction of input
        yspd += diry * acceleration;
        //limit max spd
        if abs(yspd) > spd
            yspd = sign(yspd) * spd;
    }  
    //not moving
    else if diry == 0 {
        //decelerate when no input is given
        if yspd > 0 {
            yspd -= frict;
            if yspd < 0 yspd = 0;
                } else if yspd < 0 {
            yspd += frict
            if yspd > 0 yspd = 0;
                }
    }
	
	
}