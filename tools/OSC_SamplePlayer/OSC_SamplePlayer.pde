import processing.sound.*;
import oscP5.*;
import netP5.*;

OscP5 oscP5;
SoundFile kick;
SoundFile snare;

void setup() {
  size(640, 360);
  background(255);


  oscP5 = new OscP5(this, 8000);



  // Load a soundfile from the /data folder of the sketch and play it back
  kick = new SoundFile(this, "kick.wav");
  snare = new SoundFile(this, "snare.wav");
  kick.play();
  delay(2000);
  snare.play();
}

void draw() {
}

void oscEvent(OscMessage msg) {
  String address = msg.addrPattern();

  if (address.equals("/wek/outputs")) {
    if (msg.checkTypetag("f")) {
      float firstValue = msg.get(0).floatValue();
      println(" values: "+firstValue);
      if (firstValue == 1) {
        println("trigger kick");
        kick.play();
      }
      if (firstValue == 2) {
        println("trigger snare");
        snare.play();
      }
    }
  }
}
