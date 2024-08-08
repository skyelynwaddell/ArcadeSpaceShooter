array_pop(global.enemies[0])
event_inherited()
global.gameState = global.state.PHASE1
//global.round = 0
global.minibosshp.current = global.minibosshp.maximum
//instance_create_depth(x,y,depth,oHealthPack)
with(oEnemyBullet) instance_destroy()
global.freezeGame = false

with(oCamera) target = oPlayer