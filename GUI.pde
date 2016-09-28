import controlP5.*;

class GUI {
  ControlP5 slider;

  GUI(PApplet p) {
    slider = new ControlP5(p);
    slider.addSlider("luminance", 0, 100, 50, 50, 50, 200, 20).setNumberOfTickMarks(11);
  }

  void show() {
    slider.show();
  }
  void hide() {
    slider.hide();
  }
  float getLuminance() {
    float luminance = map(slider.getController("luminance").getValue(), 0, 100, 0, 255);
    return luminance;
  }
}