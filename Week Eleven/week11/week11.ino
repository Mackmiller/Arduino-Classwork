 char val; // Data received from the serial port
 int ledPin = 8; 
 int ledPin2 = 12;

void setup() {
   pinMode(ledPin, OUTPUT); 
   pinMode(ledPin2, OUTPUT); 
   
   /
   Serial.begin(9600); 
}

void loop() {
  // put your main code here, to run repeatedly:

if (Serial.available()) 
   { // If data is available to read,
     val = Serial.read(); 
   }
   if (val == '1') 
   { // If 1 was received
     digitalWrite(ledPin, HIGH);
     digitalWrite(ledPin2, HIGH);
   } else {
     digitalWrite(ledPin, LOW);
     digitalWrite(ledPin2, LOW);
 
   }
   delay(10); 
}
