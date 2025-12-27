SubWindow subWindow;
void setup() {
  size(1200, 700);
  subWindow = new SubWindow();
  number++;
  
  
 PFont font = createFont("Meiryo", 50);
 textFont(font);
  fill(0);
  textSize(30);
}

void draw() {
  background(100, 150, 250);
  fill(255);
  textSize(20);
  line(width/2,0,width/2,height);
  

    //ボタン
    fill(255);
    rect(width/4-150, height-250, 300, 50);//外スタート・ストップ
    rect((width/4)*3-150, height-250, 300, 50);//内スタート・ストップ
    rect(width/4-150, height-150, 300, 50);//外スタート・ストップ
    rect((width/4)*3-150, height-150, 300, 50);//内スタート・ストップ
    rect(width/4-150, 100, 50, 50);//＋マイナス
    rect(width/4+150, 100, 50, 50);//＋マイナス
    rect((width/4)*3-150, 100, 50, 50);//プラスマイナス
    rect((width/4)*3+150, 100, 50, 50);//プラスマイナス
    fill(0);
    text("スタート/ストップ", width/4-130, height-210);
    text("スタート/ストップ", (width/4)*3-130, height-210);
    text("リセット", width/4-130, height-110);
    text("リセット", (width/4)*3-130, height-110);
    
    //計算
    //if(move_out){
    //  time_out++;
    //  seconds_out=time_out/60;
    //}    
    //if(move_in){
    //  time_in++;
    //  seconds_in=time_in/60;
    //}
    
    //数字
    fill(0);
    textSize(150);
    text(number_in,(width/4),170);
    text(number_out,(width/4)*3,170);
    fill(250, 150, 100);
    textSize(200);
    text((int)(seconds_in/60),60,height/2);
    text((int)(seconds_out/60),width/2+60,height/2);
    textSize(50);
    text(seconds_in%60,350,height/2);
    text(seconds_out%60,width/2+350,height/2);

    if (mousePressed) {
      if (wait+1000<=millis()) {
        wait=millis();
        number++;
        if(mouseX>=width/4-150 && mouseY>=height-250 && mouseX<=width/4+150 && mouseY <=height-200){
          println("外線スタート");
          button(12);
        }
        if(mouseX>=(width/4)*3-150 && mouseY>=height-250 && mouseX<=(width/4)*3+150 && mouseY <=height-200){
          println("内線スタート");
          button(11);
        }
        if(mouseX>=width/4-150 && mouseY>=height-150 && mouseX<=width/4+150 && mouseY <=height-100){
          println("外線リセット");
          button(22);
        }
        if(mouseX>=(width/4)*3-150 && mouseY>=height-150 && mouseX<=(width/4)*3+150 && mouseY <=height-100){
          println("内線リセット");
          button(21);
        }  
                if(mouseX>=width/4-150 && mouseY>=100&& mouseX<=width/4-100 && mouseY <=150 ){
          println("外線マイナス");
          number_in--;
        }
        if(mouseX>=width/4+150 && mouseY>=100 && mouseX<=width/4+200 && mouseY <=150){
          println("内線リセット");
          number_in++;
        }     
        if(mouseX>=(width/4)*3-150 && mouseY>=100&& mouseX<=(width/4)*3-100 && mouseY <=150 ){
          println("外線マイナス");
          number_out--;
        }
        if(mouseX>=(width/4)*3+150 && mouseY>=100 && mouseX<=(width/4)*3+200 && mouseY <=150){
          println("内線リセット");
          number_out++;
        }
      }
    }
}

    //rect(width/4-150, 100, 50, 50);//＋マイナス
    //rect(width/4+150, 100, 50, 50);//＋マイナス
    //rect((width/4)*3-150, 100, 50, 50);//プラスマイナス
    //rect((width/4)*3+150, 100, 50, 50);//プラスマイナス
