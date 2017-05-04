

/**
  * This sketch demonstrates how to use the BeatDetect object in FREQ_ENERGY mode.<br />
  * You can use <code>isKick</code>, <code>isSnare</code>, </code>isHat</code>, <code>isRange</code>,
  * and <code>isOnset(int)</code> to track whatever kind of beats you are looking to track, they will report
  * true or false based on the state of the analysis. To "tick" the analysis you must call <code>detect</code>
  * with successive buffers of audio. You can do this inside of <code>draw</code>, but you are likely to miss some
  * audio buffers if you do this. The sketch implements an <code>AudioListener</code> called <code>BeatListener</code>
  * so that it can call <code>detect</code> on every buffer of audio processed by the system without repeating a buffer
  * or missing one.
  * <p>
  * This sketch plays an entire song so it may be a little slow to load.
  */

import processing.serial.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import cc.arduino.*;

Serial myPort;
String val;

Minim minim;
AudioPlayer song;
AudioPlayer song2;
BeatDetect beat;
BeatListener bl;
Arduino arduino;

int ledPin =  7;    // LED connected to digital pin 12
int ledPin2 =  8;    // LED connected to digital pin 1
int ledPin3 =  3; 
int ledPin4 =  4; 
int ledPin5 =  5; 
int ledPin6 =  6; 
int ledPin7 = 9;
int ledPin8 = 10;
int ledPin9 = 11;
int ledPin10 = 12;
int ledPin11 = 0;
int ledPin12 = 1;
int ledPin13 =  13; 

// LED connected to digital pin 0
int mySwitch = 2;

float kickSize, snareSize, hatSize;

void setup() {
  size(512, 200, P3D);

  minim = new Minim(this);
  arduino = new Arduino(this, Arduino.list()[2], 57600);
  arduino.pinMode(mySwitch, Arduino.INPUT);
  arduino.pinMode(ledPin, Arduino.OUTPUT);
  arduino.pinMode(ledPin2, Arduino.OUTPUT);
  arduino.pinMode(ledPin3, Arduino.OUTPUT);
  arduino.pinMode(ledPin4, Arduino.OUTPUT);
  arduino.pinMode(ledPin5, Arduino.OUTPUT);
  arduino.pinMode(ledPin6, Arduino.OUTPUT);
  arduino.pinMode(ledPin7, Arduino.OUTPUT);
  arduino.pinMode(ledPin8, Arduino.OUTPUT);
  arduino.pinMode(ledPin9, Arduino.OUTPUT);
  arduino.pinMode(ledPin10, Arduino.OUTPUT);
  arduino.pinMode(ledPin11, Arduino.OUTPUT);   
  arduino.pinMode(ledPin12, Arduino.OUTPUT);
  arduino.pinMode(ledPin13, Arduino.OUTPUT);
         

  

  song = minim.loadFile("sun5.mp3", 2048);
  //song = minim.loadFile("night.mp3", 2048);
 // song.play();
  // a beat detection object that is FREQ_ENERGY mode that
  // expects buffers the length of song's buffer size
  // and samples captured at songs's sample rate
  beat = new BeatDetect(song.bufferSize(), song.sampleRate());
  // set the sensitivity to 300 milliseconds
  // After a beat has been detected, the algorithm will wait for 300 milliseconds
  // before allowing another beat to be reported. You can use this to dampen the
  // algorithm if it is giving too many false-positives. The default value is 10,
  // which is essentially no damping. If you try to set the sensitivity to a negative value,
  // an error will be reported and it will be set to 10 instead.
  beat.setSensitivity(100);
  // make a new beat listener, so that we won't miss any buffers for the analysis
  bl = new BeatListener(beat, song);
 
  arduino.pinMode(ledPin, Arduino.OUTPUT);
  arduino.pinMode(ledPin2, Arduino.OUTPUT);
  arduino.pinMode(ledPin3, Arduino.OUTPUT);
  arduino.pinMode(ledPin4, Arduino.OUTPUT);
  arduino.pinMode(ledPin5, Arduino.OUTPUT);
  arduino.pinMode(ledPin6, Arduino.OUTPUT);
  arduino.pinMode(ledPin7, Arduino.OUTPUT);
  arduino.pinMode(ledPin8, Arduino.OUTPUT);
  arduino.pinMode(ledPin9, Arduino.OUTPUT);
  arduino.pinMode(ledPin10, Arduino.OUTPUT);
  arduino.pinMode(ledPin11, Arduino.OUTPUT);   
  arduino.pinMode(ledPin12, Arduino.OUTPUT);
  arduino.pinMode(ledPin13, Arduino.OUTPUT);
        
  
  

 
}


void draw() {

 if (arduino.digitalRead(mySwitch) == Arduino.HIGH) {
   background(0);
  fill(255);
     song.play();
  }
  
  
if (arduino.digitalRead(mySwitch) == Arduino.LOW) {
    beat.isKick();
 if (beat.isKick()){ 
      arduino.digitalWrite(ledPin, Arduino.HIGH);  
      arduino.digitalWrite(ledPin2, Arduino.HIGH);
      arduino.digitalWrite(ledPin3, Arduino.HIGH);
      arduino.digitalWrite(ledPin4, Arduino.HIGH);  
      arduino.digitalWrite(ledPin5, Arduino.HIGH);  
      arduino.digitalWrite(ledPin6, Arduino.HIGH);  
      arduino.digitalWrite(ledPin7, Arduino.HIGH);
      arduino.digitalWrite(ledPin8, Arduino.HIGH);
      arduino.digitalWrite(ledPin9, Arduino.HIGH);
      arduino.digitalWrite(ledPin10, Arduino.HIGH);
      arduino.digitalWrite(ledPin11, Arduino.HIGH);  
      arduino.digitalWrite(ledPin12, Arduino.HIGH);  
      arduino.digitalWrite(ledPin13, Arduino.HIGH); 
     }
     
   // song.play();

      // set the LED on
   
  arduino.digitalWrite(ledPin, Arduino.LOW);    // set the LED off
  arduino.digitalWrite(ledPin2, Arduino.LOW);    // set the LED off
  arduino.digitalWrite(ledPin3, Arduino.LOW);  
  arduino.digitalWrite(ledPin4, Arduino.LOW); 
  arduino.digitalWrite(ledPin5, Arduino.LOW); 
  arduino.digitalWrite(ledPin6, Arduino.LOW); 
  arduino.digitalWrite(ledPin7, Arduino.LOW);   
  arduino.digitalWrite(ledPin8, Arduino.LOW);
  arduino.digitalWrite(ledPin9, Arduino.LOW);
  arduino.digitalWrite(ledPin10, Arduino.LOW);
  arduino.digitalWrite(ledPin11, Arduino.LOW);
  arduino.digitalWrite(ledPin12, Arduino.LOW);
  arduino.digitalWrite(ledPin13, Arduino.LOW); 
 }}// set the LED off
  
  
void stop() {
  // always close Minim audio classes when you are finished with them
  song.close();
  // always stop Minim before exiting
  minim.stop();
  // this closes the sketch
  super.stop();
}