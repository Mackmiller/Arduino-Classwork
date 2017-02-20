#define ledRed 13
#define switch0Red 2 //sets to pin 2


int switchState = 0;

void setup() {
  // put your setup code here, to run once:
  Serial.begin(9600);
  
  pinMode(ledRed, OUTPUT);
  pinMode(switch0Red, INPUT);

  pinMode(ledYel, OUTPUT);
  pinMode(switch0Yel, INPUT);
}

void loop() {
  // put your main code here, to run repeatedly:
 digitalWrite(ledRed, switchState);

 switchState = digitalRead(switch0Red);
 Serial.print("switchState");
 Serial.println(switchState);

 digitalWrite(ledYel, switchState);
 
 switchState = digitalRead(switch0Yel);
 Serial.print("switchState");
 Serial.println(switchState);
}
