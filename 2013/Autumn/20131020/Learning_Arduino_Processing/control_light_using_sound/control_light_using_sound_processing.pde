import ddf.minim.*;
import ddf.minim.analysis.*;
import processing.serial.*;

Minim minim;
AudioInput audioIn;
FFT fft;

Serial myPort;

int maxVolume=2000;
int volumeRaw=0;
int volumeLevel=0;

void setup(){
  size(450, 255);
  
  minim = new Minim(this);
  minim.debugOn();
  
  // get a line in from Minim, default bit depth is 16
  audioIn = minim.getLineIn(Minim.STEREO, 512);

  //Serial setup
  String portName = Serial.list()[0];
  println(portName);
  myPort = new Serial(this,portName,9600);
}

void draw(){
  background(204);
  stroke(0);
  
  volumeRaw=0;
  
  for(int i = 0; i < audioIn.bufferSize() - 1; i++)
  {
    //根据左右声道的音量分别画线
    line(i, 50 + audioIn.left.get(i)*50, i+1, 50 + audioIn.left.get(i+1)*50);
    line(i, 150 + audioIn.right.get(i)*50, i+1, 150 + audioIn.right.get(i+1)*50);

    volumeRaw+=abs(audioIn.left.get(i)*10)+abs(audioIn.right.get(i)*10);
  }
  
  //volumeLevel大小为一个字节，getVolumeLevel函数将音量范围映射到一个字节范围内
  volumeLevel=getVolumeLevel(volumeRaw);
  println(volumeLevel);
  myPort.write(volumeLevel);
}

int getVolumeLevel(int volumeRaw){
  int tempLevel=0;
  if(volumeRaw>maxVolume)
    tempLevel=254;
  else{
    tempLevel=(int)map(volumeRaw, 0, maxVolume, 0, 254);
  }
  
  return tempLevel;
}

void stop()
{
  // always close Minim audio classes when you are done with them
  audioIn.close();
  minim.stop();
  
  super.stop();
}
