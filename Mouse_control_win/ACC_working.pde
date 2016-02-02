import processing.serial.*;
Serial serial;
byte[] recv = new byte[7];
int[] recv1 = new int[7];
int[] data = new int[3];



//------------------------------------------------------------
void setup() {  
 size(800,800);
  serial=new Serial(this, Serial.list()[1], 19200) ; 
 background(80);  
  serial.bufferUntil('\n');
  serial.clear();
}
//------------------------------------------------------------
void data() {  
  for (byte i=0; i<7; i++) {
    if (recv[i]<0) {
      recv1[i]=recv[i]+256;
    } else {
      recv1[i]=recv[i];
    }
  } 
  for (byte i=0; i<3; i++) {
    data[i]=((recv1[2*i])<<8)+recv1[2*i+1];
  }
}
//------------------------------------------------------------

void serialEvent(Serial serial) {  
  serial.readBytesUntil(10, recv);
  data();
}
//------------------------------------------------------------
void draw() { 
print(data[0]);print(" ");print(data[1]);print(" ");println(data[2]);
  ellipse((data[0]-360)*5+400, (data[1]-340)*5+400, 50, (data[2]-432)*5);
}  

