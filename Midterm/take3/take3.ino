#define led 13
#define led2 12
const int buzzPin = 9;
const int noteLength = 15;
const int drumLength = 5;
const int freqs[] = {260, 262, 277, 294, 311,330,349,370,392,415,440,466,494,523};
const int snare[] = {300,800,1100,650,800,900,400,1050};
const int kick[] = {150,160,140,155,400,90,95,100};
const int sub_kick[] = {40,40,40,40,40,40,40,40};

//C = 260 I(0), G = 392 V(8), Am = 440 vi(10), F = 349 IV(6)

void setup()
{
  Serial.begin(9600);

  pinMode(led, OUTPUT); //major chord- yellow for happy 
  pinMode(led2, OUTPUT); //minor chord- blue for sad
  pinMode(buzzPin, OUTPUT);
}
 
void playNotes(int notes[],unsigned long duration)
{
  unsigned long start = millis();
  while( millis() - start <= duration)
  {
    for (int i = 0; i<=3; i++)
    {
      tone(buzzPin,freqs[notes[i]]);
      delay(noteLength);
    }
    noTone(buzzPin);
  }
 
}
 
void snareHit()
{
  unsigned long start = millis();
  while( millis() - start <= 70)
  {
    for (int i = 0; i<8; i++)
    {
      tone(buzzPin,snare[i]);
      delay(drumLength);
    }
    noTone(buzzPin);
  }
}
 
void kickHit()
{
  unsigned long start = millis();
  while( millis() - start <= 70)
  {
    for (int i = 0; i<8; i++)
    {
      tone(buzzPin,kick[i]);
      delay(drumLength);
    }
    noTone(buzzPin);
  }
}
 
 
int chord[3];
 
void major(int root)
{
  chord[0] = root;
  chord[1] = root + 4;
  chord[2] = root + 7;
  digitalWrite(led,HIGH);
  digitalWrite(led2,LOW);
}
 
void minor(int root)
{
  chord[0] = root;
  chord[1] = root + 3;
  chord[2] = root + 7;
  digitalWrite(led2,HIGH);
  digitalWrite(led,LOW);
}
 
void loop()
{
  kickHit();
  delay(115);
  minor(2);
  playNotes(chord,1000);
  delay(185);
  snareHit();
  delay(115);
  major(5);
  playNotes(chord,1000);
 
  major(0);
  playNotes(chord,2000);
  delay(185);
  snareHit();
  delay(315); 
  major(5);
  playNotes(chord,3850); 
 
 
}

