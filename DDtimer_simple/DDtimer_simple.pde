//タイマー1
boolean timermove1 = false;
int starttime1;
int timecount1 = 0;
//タイマー2
boolean timermove2 = false;
int starttime2;
int timecount2 = 0;
//その他
boolean mouseclick = false;

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
            if (mouseX <=  width / 2) {
                if (timermove1) {
                    println(millis() / 1000 - starttime1);
                } else{
                    starttime1 = millis() / 1000;
                }
                timermove1 = !timermove1;
            }
            if (mouseX >=  width / 2) {
                if (timermove2) {
                    println(millis() / 1000 - starttime2);
                } else{
                    starttime2 = millis() / 1000;
                }
                timermove2 = !timermove2;
            }
        }
        mouseclick = false;
    }
    //println(millis() / 1000 - starttime);
    //println(timermove);
    
    //タイマー1が動作状態なら、時間を更新する
    if (timermove1) {
        timecount1 = millis() / 1000 - starttime1;
    }
    if (timermove2) {
        timecount2 = millis() / 1000 - starttime2;
        
    }
    //タイマーの動作に関わらず時間を表示
    textSize(100);
    text(timecount1 / 60 + "：" + (timecount1 - (timecount1 / 60) * 60), width / 4 - 100, height / 2);
    text(timecount2 / 60 + "：" + (timecount2 - (timecount2 / 60) * 60),(width / 4) * 3 - 100, height / 2);
    textSize(30);
}