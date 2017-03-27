//*****************************************************************************
//
// Test of playtune library for Arduino NANO
//
// L. Shustek, 31 Jan 2011, initial release.
// L. Shustek, 27 Feb 2011, new score data
// L. Shustek, 6 April 2015; change for compatibility with Arduino IDE v1.6.x
// T. Wasiluk, 28 May 2016; added debug & delay code, moved to examples subdirectory
//
//*****************************************************************************


#include <Playtune.h>

//------------------------------------------------
//   scores are put in program space memory
//------------------------------------------------

// Playtune bytestream for file "bach_bwv798.mid" created by MIDITONES V1.1 on Sun Feb 27 12:45:00 2011
// Playtune bytestream for file "mapleaf2.mid" created by MIDITONES V1.1 on Sat Feb 26 13:02:34 2011

const byte PROGMEM score2 [] = {
// Maple Leaf Rag
3,232, 0x90,0x27, 0x91,0x33, 1,77, 0x81, 0x80, 0x90,0x2C, 0x91,0x38, 0,166, 0x92,0x44, 0,166, 0x82, 
0x81, 0x80, 0x90,0x33, 0x91,0x3C, 0x92,0x38, 0x93};



Playtune pt;

void setup() {

  // Enable all 3 NANO timers for notes that are output on digital pins 10, 11, and 12.
  // Those pins should be wired to 500-ohm resistors, the other ends of which should be connected together
  // to one terminal of an 8-ohm speaker. The other terminal of the speaker should be connected to ground.
  // No other hardware is needed!

  pt.tune_initchan (10); 
  pt.tune_initchan (11);
  pt.tune_initchan (12);

  #define DBUG 0
  #if DBUG
  Serial.begin(9600);
  Serial.println("Debug");
  #endif
  
}

void loop() {

  pt.tune_playscore (score2); /* start playing */
  while (pt.tune_playing) ; /* wait here until playing stops */
  pt.tune_delay(1000); /* wait a second */
  
}
