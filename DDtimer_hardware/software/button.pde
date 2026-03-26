//ボタンの関数
boolean btn(int x, int y, int w, int h) {
    rect(x, y, w, h);
    if (mousePressed) {
        if (x <=  mouseX &&  mouseX <=  x + w &&  y <=  mouseY &&  mouseY <=  y + h) {
            if (!mouse) {
                mouse = true;
                return(true);
            }
        } 
    }
    return(false);
}

