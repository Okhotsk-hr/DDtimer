int wait=0;
int number=1;
boolean move_in=false;
boolean move_out=false;
int timer_in;
int timer_out;
int time_in,time_out;
int seconds_in, seconds_out;
int number_in=0;
int number_out=0;
void button(int a) {
  println("start");
  print(a);
  if (a==11) {//外線
    println("外線start/stop");
    if (move_out) {
      move_out=false;
      println("停止");
    } else {
      timer_out=millis();
      move_out=true;
      println("開始");
    }
    
  } else if (a==12) {//内線
    println("内線start/stop");
    if (move_in) {
      move_in=false;
      println("停止");
    } else {
      timer_in=millis();
      move_in=true;
      println("開始");
    }
  } else if (a==21) {//外線リセット
    println("外線リセット");
        if (!move_out) {
      time_out=0;
      seconds_out=0;
    }
  } else if (a==22) {
    println("内線リセット");
        if (!move_in) {
      time_in=0;
      seconds_in=0;
    }
  }
}
