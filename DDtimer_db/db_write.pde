void write_num() {
    callurl = url + "?mode=write_num&num1=" + number1 + "&num2=" + number2;
    String[] response = loadStrings(callurl);
}

void write_data() {
    callurl = url + "?mode=write_data&num1=" + number1 + "&num2=" + number2;
    String[] response = loadStrings(callurl);
}