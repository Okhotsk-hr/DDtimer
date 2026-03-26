int pins[7] = {12, 10, 11, A0, A1, A2, A3};

void setup()
{
    Serial.begin(9600);

    for (int i = 0; i < 7; i++)
    {
        pinMode(pins[i], INPUT_PULLUP); // ←ここ重要
    }
}

void loop()
{
    String data = "";

    for (int i = 0; i < 7; i++)
    {
        data += String(digitalRead(pins[i]));

        if (i < 6)
        {
            data += ",";
        }
    }

    Serial.println(data);
    delay(100);
}