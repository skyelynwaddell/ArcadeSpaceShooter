/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();
//BehindShadow

if global.freezeGame return;

yspdDefault += 0.0001 * sign(yspd)
yspd += 0.0001 * sign(yspd)

if !goIn 
    xspd -= 0.001 * sign(xspd)
else 
    xspd += 0.001 * sign(xspd)

if xspd == 0 goIn = true
if xspd == 2 * sign(xspd) goIn = false

depth = -400

var _age = 50
switch(state){
    case WAIT:
        yspd = lerp(yspd, 0, 0.01)
        if age > _age {
            age = 0
            yspd = yspdDefault * -1
            yspdDefault = yspd
            state = MOVE 
        }
    break;
    case MOVE:
        if age > _age {
            xspd = xspd * -1
            age = 0
            state = WAIT 
        }
    break;
}

if age == _age && sign(yspd) == 1 {
    //shoot = true 
}

if shoot {
    //shoot  = false
    for (var i = 0; i < 1 + global.round; i++) {
        var ShootBullet = function(){
            var spawnBullet = function(){
                return instance_create_depth(x + 8, y + 16, -10000, oEnemyBullet)
            }
            var bullet = spawnBullet()
            if instance_exists(oPlayer) {
                with (bullet) {
                    direction = point_direction(x, y, oPlayer.x, oPlayer.y)    
                    sprite_index = sEnemyBullet2
                }
            } 
        }
        call_later(10 * i, time_source_units_frames, ShootBullet)
    }
    shoot = false
}

pause--
pause = clamp(pause, 0, 100)
x += xspd
y += yspd

// Set the sprite to face the direction of movement
if xspd != 0 || yspd != 0 {
    image_angle = point_direction(0, 0, xspd, yspd)
}

if instance_exists(shadow) {
    var _x = x + sprite_width / 2
    var _y = y + 20
    with (shadow) {
        x = _x
        y = _y
    }
}
