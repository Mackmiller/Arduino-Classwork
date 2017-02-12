QUICK NOTE: A tuning device

Sometimes musicians need a quick reference to a pitch. Sometimes this is achieved via a piano, or with singers- a harmonica-like device. A is a common tuning note for musicians to use as pitch reference. Sometimes having a C handy is useful too, when singing in the fixed do solfege system. The button attached to the yellow LED represents the C pitch, and the button attached the red represents A. When the user presses each button, the corresponding note sounds via a small speaker that is hooked up to the Arduino. The pitch quality is very minimal, and so should only be used as a quick reference as opposed to a true tuning device. Obviously more code would be necessary to program the speakers-arduino-pitch relationships, but the two button layout is a good start. The basic code is included below for the two buttons.

![basic setup](setup.jpg)
![red LED button](red.jpg)
![yellow LED button](yellow.jpg)


#define ledRed 13
#define switch0Red 2 //sets to pin 2

#define ledYel 12
#define switch0Yel 1

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
