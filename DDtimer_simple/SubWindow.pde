//サブディスプレイは表示のみ
class SubWindow extends PApplet {
    SubWindow() {
        String[] args = {"SubWindow"};
        PApplet.runSketch(args, this);
    }
    
    void settings() {
        size(1160, 830);
    }
    
    void setup() {
        surface.setLocation( -1500, 0);
        
        PFont font = createFont("Meiryo", 50);
        textFont(font);
        fill(0);
        textSize(30);
    }
    
    void draw() {
        background(255);
        
        //整理番号を表示
        textSize(50);
        text(number2, width / 4 , 100);
        text(number1,(width / 4) * 3 , 100);
        textSize(30);
        
        textSize(50);
        text("外回り", width / 4 - 50 , 300);
        text("内回り",(width / 4) * 3 - 50 , 300);
        textSize(30);
        
        //タイマーの動作に関わらず時間を表示
        textSize(100);
        text(timecount2 / 60 + "：" + (timecount2 - (timecount2 / 60) * 60), width / 4 - 100, height / 2);
        text(timecount1 / 60 + "：" + (timecount1 - (timecount1 / 60) * 60),(width / 4) * 3 - 100, height / 2);
        textSize(30);
    }
}
