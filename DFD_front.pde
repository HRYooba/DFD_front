import netP5.*;
import oscP5.*;

GUI gui;
OscP5 oscP5;
NetAddress myRemoteLocation;

boolean isShowGUI;
float buffLuminance;

void setup() {
  isShowGUI = true;
  gui = new GUI(this);
  oscP5 = new OscP5(this, 1234);
  myRemoteLocation = new NetAddress("127.0.0.1", 5555);
  fullScreen();
}

void draw() {
  background(0);
  if (isShowGUI) {
    gui.show();
  } else {
    gui.hide();
  }
  fill(gui.getLuminance());
  ellipse(width / 2, height / 2, 300, 300);
  ellipse(width / 2 - 400, height / 2, 300, 300);
  if (buffLuminance != gui.getLuminance()) {
    buffLuminance = gui.getLuminance();
    OscMessage myMessage = new OscMessage("/message");
    myMessage.add(buffLuminance);
    oscP5.send(myMessage, myRemoteLocation);
  }
}


void keyPressed() {
  if (key == ' ') {
    isShowGUI = !isShowGUI;
  }
}