import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import processing.serial.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class ACC_OUTPUT extends PApplet {


Serial serial;
int flag=0;
float[][] val=new float[3][40];
float[] value=new float[3];
float[] axis=new float[3];
//------------------------------------------------------------
public void setup() {  
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

public void read() {

    for (int i=0;i<3;i++) { 
      value[i]= serial.read()-axis[i];

  }
}


//------------------------------------------------------------

//------------------------------------------------------------
public void draw() {  

  if(flag==1){rect(30,30,40,40);}
 read();
  ellipse(value[0]*10+350, value[1]*10+350, 50, value[2]+10);
}  


  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "--full-screen", "--bgcolor=#666666", "--stop-color=#cccccc", "ACC_OUTPUT" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
