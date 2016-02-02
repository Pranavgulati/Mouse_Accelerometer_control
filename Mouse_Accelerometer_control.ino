#define vcc 19
#define gnd 18
#define xpin  17                  // x-axis of the accelerometer
#define ypin  16                  // y-axis
#define zpin  15                 // z-axis (only on 3-axis models)
int data[7]={0};
char send[7]={0};

void setup(){
pinMode(vcc,OUTPUT);
pinMode(gnd,OUTPUT);
pinMode(xpin,INPUT);
pinMode(ypin,INPUT);
pinMode(xpin,INPUT);
digitalWrite(vcc,HIGH);
digitalWrite(gnd,LOW);
  
    delay(100);
  // initialize the serial communications:
  Serial.begin(19200);
  delay(100);
}

void loop()
{ 
  data[0]=analogRead(xpin);
  data[1]=analogRead(ypin);
  data[2]=analogRead(zpin);
  send[0]=data[0]>>8; 
  send[1]=data[0];
  send[2]=data[1]>>8; 
  send[3]=data[1];
  send[4]=data[2]>>8; 
  send[5]=data[2];
  send[6]='\n';
  for(byte i=0;i<7;i++){
    Serial.write((byte)send[i]);  //for processing
  }
 /* for(byte i=0;i<7;i++){
    Serial.print((byte)send[i]);Serial.print(" "); //for arduino
  }Serial.println();*/
  delay(100);

}

