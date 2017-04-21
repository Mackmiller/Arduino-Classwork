import processing.serial.*;

Serial myPort;


void setup(){
  size(200,200);
  String portName = Serial.list()[2];
  myPort = new Serial(this, portName, 9600); 
}

void draw(){
 if (mousePressed == true){    //if we clicked in the window
   myPort.write('1');         //send a 1
   println("1");   
  } else 
  {                           //otherwise
  myPort.write('0');          //send a 0
  }   
}