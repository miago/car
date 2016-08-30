Car car;

void setup() {
  size(600, 600);

  background(Settings.g_backgroundColor);
  frameRate(Settings.g_frameRate);
  
  car = new Car();
}

void draw() {
  background(Settings.g_backgroundColor);
  car.drawYourself();
  
  arc(30,4,10,0,0,6);
}

void keyPressed() {
  if(keyCode == RIGHT) {
    car.incrementOrientation();
  }
  
  if(keyCode == LEFT) {
    car.decrementOrientation();
  }
  
  if(keyCode == UP) {
    car.makeOneStepForward();
  }
  
   if(keyCode == DOWN) {
    car.makeOneStepBackward();
  }
  
}