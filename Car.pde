class Car {
  
  Dimension carDimension;
  float orientation;
  float wheelOrientation;
  Point position;
  Point[] edge;
  Wheel[] wheels;
  
  Car() {
    position = new Point(Settings.c_carOriginalPosition_x, Settings.c_carOriginalPosition_y);
    orientation = Settings.c_carOriginalOrientation;  
    carDimension = new Dimension(Settings.c_carSize_w, Settings.c_carSize_h);
    edge = new Point[4];
    
    wheels = new Wheel[4];

    wheels[0] = new Wheel(+Settings.w_wheelsOffsetFromCenter_w, +Settings.w_wheelsOffsetFromCenter_h, 0, this);
    wheels[1] = new Wheel(-Settings.w_wheelsOffsetFromCenter_w, +Settings.w_wheelsOffsetFromCenter_h, 0, this);
    wheels[2] = new Wheel(-Settings.w_wheelsOffsetFromCenter_w, -Settings.w_wheelsOffsetFromCenter_h, 0, this);
    wheels[3] = new Wheel(+Settings.w_wheelsOffsetFromCenter_w, -Settings.w_wheelsOffsetFromCenter_h, 0, this);
    
  }

  void drawYourself() {
    recalculateCarEdges();
    
    line(edge[0].x, edge[0].y, edge[1].x, edge[1].y);
    line(edge[1].x, edge[1].y, edge[2].x, edge[2].y);
    line(edge[2].x, edge[2].y, edge[3].x, edge[3].y);
    line(edge[3].x, edge[3].y, edge[0].x, edge[0].y);
    
    wheels[0].drawYourself();
    wheels[1].drawYourself();
    wheels[2].drawYourself();
    wheels[3].drawYourself();
  }
  
  void recalculateCarEdges() {
    edge[0] = new Point(position.x - carDimension.w/2, position.y - carDimension.h/2);
    edge[1] = new Point(position.x - carDimension.w/2, position.y + carDimension.h/2);
    edge[2] = new Point(position.x + carDimension.w/2, position.y + carDimension.h/2);
    edge[3] = new Point(position.x + carDimension.w/2, position.y - carDimension.h/2);
    
    edge[0].rotateMe(position, orientation); 
    edge[1].rotateMe(position, orientation);
    edge[2].rotateMe(position, orientation);
    edge[3].rotateMe(position, orientation);
  }
  
  void incrementOrientation(){
    wheelOrientation += PI / 32;
    boundWheelOrientation();
    wheels[0].orientation = wheelOrientation;
    wheels[1].orientation = wheelOrientation;
  }
  
  void decrementOrientation(){
    wheelOrientation -= PI / 32;
    boundWheelOrientation();
    wheels[0].orientation = wheelOrientation;
    wheels[1].orientation = wheelOrientation;
  }
  
  void boundWheelOrientation(){
    if(wheelOrientation < -Settings.w_maxOrientation) {
      wheelOrientation = -Settings.w_maxOrientation;
    }
    
    if(wheelOrientation > Settings.w_maxOrientation) {
      wheelOrientation = Settings.w_maxOrientation;
    }
      
  }
  
  void makeOneStepForward(){
    position.x = position.x + cos(orientation+PI/2)*3;
    position.y = position.y + sin(orientation+PI/2)*3;
  }
  
  void makeOneStepBackward(){
    position.x = position.x + cos(orientation+PI/2)*3;
    position.y = position.y + sin(orientation+PI/2)*3;
  }
}