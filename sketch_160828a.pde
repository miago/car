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
}

void keyPressed() {
  if(keyCode == RIGHT) {
    car.incrementOrientation();
  }
  
  if(keyCode == LEFT) {
    car.decrementOrientation();
  }
}