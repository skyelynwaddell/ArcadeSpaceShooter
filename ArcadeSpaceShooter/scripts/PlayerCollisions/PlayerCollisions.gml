function PlayerCollisions(){
    var onepixel;
    
    onepixel = sign(yspd)
    //check if we are touching a vertical Wall
    if (place_meeting(x, y + yspd, oWall)) {
        
        //while player is not +1 or -1 pixel of their speed from the wall
        while (!place_meeting(x, y + onepixel, oWall)) {
            
            //increase player +1 or -1 pixel of their yspd
            y += onepixel
        }
        
        //stop falling while touching a Wall
        yspd = 0
        
        if place_meeting(x, y + 10, oWall)
            jumpCount.current = jumpCount.max;
        
        isOnFloor = true;
        
        if mvtLocked <= 0
            canDash = true;
    } else {
        isOnFloor = false;
    }
    
    y += yspd;
    
    //check if we are touching a horizontal Wall
    onepixel = sign(xspd)
    if (place_meeting(x + xspd, y, oWall)) {
        
        //while player is  +1 or -1 pixel of their speed from the wall
        while (!place_meeting(x + onepixel, y, oWall)) {
            
            //increase player +1 or -1 pixel of their xspd
            x += onepixel
        }
        
        //stop moving while touching a Wall
        xspd = 0
        isOnWall = true;
    } else {
        isOnWall = false;
    }
    x += xspd;
}