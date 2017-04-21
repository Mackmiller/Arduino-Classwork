 char val; // Data received from the serial port
 int ledPin = 8; // Set the pin to digital I/O 13
 int ledPin2 = 12;

void setup() {
   pinMode(ledPin, OUTPUT); 
   pinMode(ledPin2, OUTPUT); 
   
   // Set pin as OUTPUT
   Serial.begin(9600); // Start serial communication at 9600 bps
}

void loop() {
  // put your main code here, to run repeatedly:

if (Serial.available()) 
   { // If data is available to read,
     val = Serial.read(); // read it and store it in val
   }
   if (val == '1') 
   { // If 1 was received
     digitalWrite(ledPin, HIGH);
     digitalWrite(ledPin2, HIGH);// turn the LED on
   } else {
     digitalWrite(ledPin, LOW);
     digitalWrite(ledPin2, LOW);
     // otherwise turn it off
   }
   delay(10); // Wait 10 milliseconds for next reading
}
