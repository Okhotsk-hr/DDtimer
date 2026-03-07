int number1 = 0;
int number2 = 0;
boolean mouse = false;

String callurl = "";

void number() {
    //整理番号を表示
    textSize(50);
    text(number1, width / 4 , 100);
    text(number2,(width / 4) * 3 , 100);
    textSize(30);
    
    if (btn(width / 4 - 110, 60, 50, 50)) {
        number1--;
        thread("write_num");
    }
    if (btn(width / 4 + 80, 60, 50, 50)) {
        number1++;
        thread("write_num");
    }
    if (btn((width / 4) * 3  - 110, 60, 50, 50)) {
        number2--;
        thread("write_num");
    }
    if (btn((width / 4) * 3  + 80, 60, 50, 50)) {
        number2++;
        thread("write_num");
    }
    
    
}

void mouseReleased() {
    mouse = false;
}

void keyPressed() {
    if (key == 'a') {
        number1--;
    }
    if (key == 's') {
        number1++;
    }
    if (key == 'k') {
        number2--;
    }
    if (key == 'l') {
        number2++;
    }
    println(number1 + " - " + number2);
}
