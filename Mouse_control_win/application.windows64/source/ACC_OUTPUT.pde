import processing.serial.*;
Serial serial;
int flag=0;
float[][] val=new float[3][40];
float[] value=new float[3];
float[] axis=new float[3];
//------------------------------------------------------------
void setup() {  
  int x=0,y=0,z=0;
  size(700, 700);
  serial=new Serial(this, Serial.list()[1],19200) ; 
  background(80);
if (serial.read()==65) {//start byte  
      serial.clear();
   flag=1;}
   
    for (int j=0;j<40;j++) {  
      for (int i=0;i<3;i++) { 
        val[i][j]= serial.read();
      }
      x+=val[0][j];
      y+=val[1][j];
      z+=val[2][j];
    }
    axis[0]=x/40;
    axis[1]=y/40;
    axis[2]=z/40;
}

//------------------------------------------------------------

void read() {

    for (int i=0;i<3;i++) { 
      value[i]= serial.read()-axis[i];

  }
}


//------------------------------------------------------------

//------------------------------------------------------------
void draw() {  

  if(flag==1){rect(30,30,40,40);}
 read();
  ellipse(value[0]*10+350, value[1]*10+350, 50, value[2]+10);
}  


