if room == rmInit return;
if room == rmMainMenu return;

global.score = 0
global.accuracy = 0
global.totalShots = 0
global.hits = 0

yy = initY
xx = 0
SetAllTilemapsInvisible();
SetCurrentLevelVisible();

instance_create_depth(global.spawnX, global.spawnY, 1000,oPlayer)
instance_create_depth(0,0,1000,oGUI)
instance_create_depth(global.spawnX, global.spawnY,1000,oCamera)