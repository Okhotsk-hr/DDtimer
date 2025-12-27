class SubWindow extends PApplet {
  SubWindow() {
    String[] args = {"SubWindow"};
    PApplet.runSketch(args, this);
  }

  void settings() {
    size(1000, 700);
  }

  void setup() {
    background(250, 150, 100);
    number++;


    PFont font = createFont("Meiryo", 50);
    textFont(font);
    fill(0);
    textSize(30);
  }
 
  void draw() {
    background(250, 150, 100);
    fill(0);
    textSize(30);
    line(width/2, 0, width/2, height);

    //ボタン
    fill(255);
    rect(width/4-150, height-250, 300, 50);//外スタート・ストップ
    rect((width/4)*3-150, height-250, 300, 50);//内スタート・ストップ
    rect(width/4-150, height-150, 300, 50);//外スタート・ストップ
    rect((width/4)*3-150, height-150, 300, 50);//内スタート・ストップ
    fill(0);
    text("スタート/ストップ", width/4-130, height-210);
    text("スタート/ストップ", (width/4)*3-130, height-210);
    text("リセット", width/4-130, height-110);
    text("リセット", (width/4)*3-130, height-110);
    
    //計算
    if(move_out){
      time_out++;
      seconds_out=time_out/60;
    }    
    if(move_in){
      time_in++;
      seconds_in=time_in/60;
    }
    
    //数字
    
    textSize(50);
    text("整理番号"+number_out,(width/4)-200,100);
    text("整理番号"+number_in,(width/4)*3-200,100);
    fill(100, 150, 250);
    textSize(200);
    text((int)(seconds_out/60),60,height/2);
    text((int)(seconds_in/60),width/2+60,height/2);
    textSize(50);
    text(seconds_out%60,350,height/2);
    text(seconds_in%60,width/2+350,height/2);

    if (mousePressed) {
      if (wait+1000<=millis()) {
        wait=millis();
        number++;
        if(mouseX>=width/4-150 && mouseY>=height-250 && mouseX<=width/4+150 && mouseY <=height-200){
          println("外線スタート");
          button(11);
        }
        if(mouseX>=(width/4)*3-150 && mouseY>=height-250 && mouseX<=(width/4)*3+150 && mouseY <=height-200){
          println("内線スタート");
          button(12);
        }
        if(mouseX>=width/4-150 && mouseY>=height-150 && mouseX<=width/4+150 && mouseY <=height-100){
          println("外線リセット");
          button(21);
        }
        if(mouseX>=(width/4)*3-150 && mouseY>=height-150 && mouseX<=(width/4)*3+150 && mouseY <=height-100){
          println("内線リセット");
          button(22);
        }
      }
    }
  }
}
