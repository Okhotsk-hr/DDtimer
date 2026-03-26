//タイマー1
boolean timermove1 = false;
int starttime1;
int timecount1 = 0;
int savetime1 = 0;
//タイマー2
boolean timermove2 = false;
int starttime2;
int timecount2 = 0;
int savetime2 = 0;
//その他
boolean mouseclick = false;

//Arduinoとの通信
import processing.serial.*;


Serial myPort;
String received;
int[] sensors = new int[7];
int[] prevSensors = new int[7]; // 前回値を記憶

SubWindow subWindow;

void settings() {
    fullScreen();
    //size(1200, 700);
}

void setup() {
    //size(1200, 700);
    subWindow = new SubWindow();
    PFont font = createFont("Meiryo", 50);
    textFont(font);
    fill(0);
    textSize(30);
    
    thread("write_num");
    
    //Arduinoとの通信
    println(Serial.list()); // ポート確認
    myPort = new Serial(this, Serial.list()[0], 9600);
    
    myPort.bufferUntil('\n'); // 改行で受信
}

void draw() {
    background(255);
    
    //スタート・ストップボタン
    if (btn(width / 4 - 150,700,300,50)) {
        if (timermove1) {
            println(millis() / 1000 - starttime1);
            savetime1 = timecount1;
            println("タイマー1ストップ");
        } else{
            starttime1 = millis() / 1000 - savetime1;
            println("タイマー1スタート");
        }
        timermove1 = !timermove1;
    }
    if (btn((width / 4) * 3 - 150,700,300,50)) {
        if (timermove2) {
            println(millis() / 1000 - starttime2);
            savetime2 = timecount2;
            println("タイマー2ストップ");
        } else{
            starttime2 = millis() / 1000 - savetime2;
            println("タイマー2スタート");
        }
        timermove2 = !timermove2;
    }
    
    //リセットボタン
    fill(255,0,0);
    if (btn(width / 4 - 150,800,300,50)) {
        starttime1 = millis() / 1000;
        timecount1 = 0;
        println("タイマー1リセット");
    }
    if (btn((width / 4) * 3 - 150,800,300,50)) {
        starttime2 = millis() / 1000;
        timecount2 = 0;
        println("タイマー2リセット");
    }
    fill(0);
    
    
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
    
    textSize(50);
    text("内回り", width / 4 - 50, 300);
    text("外回り",(width / 4) * 3 - 50, 300);
    textSize(30);
    
    number();
}

void serialEvent(Serial p) {
    received = p.readStringUntil('\n');
    println(received);
    
    if (received != null) {
        received = trim(received); // 改行除去
        String[] values = split(received, ',');
        if (values.length == 7) {
            for (int i = 0; i < 7; i++) {
                prevSensors[i] = sensors[i]; // 前回値を保存
                sensors[i] = int(values[i]);
            }
        }
    }
    // タイマー1 スタート/ストップ（押して離したときのみ）
    if (prevSensors[3] == 1 && sensors[3] == 0) {
        if (!timermove1) {
            starttime1 = millis() / 1000 - savetime1;
            println("タイマー1スタート (センサ)");
        } else {
            savetime1 = timecount1;
            println("タイマー1ストップ (センサ)");
        }
        timermove1 = !timermove1;
    }
    // タイマー1 リセット（押して離したときのみ）
    if (prevSensors[4] == 1 && sensors[4] == 0) {
        starttime1 = millis() / 1000;
        timecount1 = 0;
        savetime1 = 0;
        timermove1 = false;
        println("タイマー1リセット (センサ)");
    }
    // タイマー2 スタート/ストップ（押して離したときのみ）
    if (prevSensors[5] == 1 && sensors[5] == 0) {
        if (!timermove2) {
            starttime2 = millis() / 1000 - savetime2;
            println("タイマー2スタート (センサ)");
        } else {
            savetime2 = timecount2;
            println("タイマー2ストップ (センサ)");
        }
        timermove2 = !timermove2;
    }
    // タイマー2 リセット（押して離したときのみ）
    if (prevSensors[6] == 1 && sensors[6] == 0) {
        starttime2 = millis() / 1000;
        timecount2 = 0;
        savetime2 = 0;
        timermove2 = false;
        println("タイマー2リセット (センサ)");
    }
}