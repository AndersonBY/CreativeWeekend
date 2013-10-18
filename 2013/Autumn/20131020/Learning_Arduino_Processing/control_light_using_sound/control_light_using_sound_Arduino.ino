int inputNum = 0;
int ledPin = 6;
void setup() {
  // put your setup code here, to run once:
  Serial.begin(9600);
  pinMode(ledPin, OUTPUT);
}

void loop() {
  // put your main code here, to run repeatedly: 
  if(Serial.available()>0){
    inputNum = Serial.read();
  }
  
  analogWrite(ledPin, inputNum);
}
