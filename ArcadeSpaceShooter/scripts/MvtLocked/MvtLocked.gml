function MvtLocked(){
    if mvtLocked > 0 {
        mvtLocked--;
        btn.left = false;
        btn.right = false;
    }
    
    mvtLocked = clamp(mvtLocked, 0, 100);
}