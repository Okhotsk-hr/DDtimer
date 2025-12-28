boolean timermove1 = false;
int starttime1;
boolean mouseclick = false;
int timecount1 = 0;

void setup() {
    fullScreen();
    PFont font = createFont("Meiryo", 50);
    textFont(font);
    fill(0);
    textSize(30);
}

void draw() {
    //現在の秒数
    //println(millis() / 1000);
    background(255);
    if (mousePressed) {
        mouseclick = true;
    } else{//マウスが離されたとき
        if (mouseclick) {
            if (timermove1) {
                println(millis() / 1000 - starttime1);
            } else{
                starttime1 = millis() / 1000;
            }
            timermove1 = !timermove1;
            //println(timermove);
            println("write");   
        }
        mouseclick = false;
    }
    //println(millis() / 1000 - starttime);
    //println(timermove);
    
    //タイマー1が動作状態なら、時間を更新する
    if (timermove1) {
        timecount1 = millis() / 1000 - starttime1;
    }
    
    //タイマーの動作に関わらず時間を表示
    text(timecount1,50,50);
}